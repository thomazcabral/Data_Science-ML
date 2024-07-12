import warnings                                                                                                                                         
import datasets                                                             
import matplotlib.pyplot as plt                                             
import math                                                                 
import scipy.stats as ss                                                                                                                                
import torch                                                                
import torch.nn as nn                                                       
from torch.utils.data import Dataset, DataLoader                            
from sklearn.preprocessing import LabelEncoder                              
from sklearn.metrics import accuracy_score, precision_score, f1_score, roc_auc_score
from sklearn.model_selection import train_test_split
import pandas as pd
import numpy as np
from torchtext.data.utils import get_tokenizer
from torchtext.vocab import build_vocab_from_iterator
from torch.nn.utils.rnn import pad_sequence

import re
import nltk
import spacy
import emoji
from nltk.corpus import stopwords
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
from sklearn.compose import ColumnTransformer                               
from sklearn.pipeline import Pipeline


nltk.download('stopwords')
warnings.filterwarnings('ignore', category=RuntimeWarning)
pd.set_option('display.max_columns', None) 

dataset = datasets.load_dataset('ucberkeley-dlab/measuring-hate-speech')
df = dataset['train'].to_pandas()

df = df.replace({True: 1.0, False: 0.0})

"""## Verificar a existência de valores NAN (not a number) indesejados"""

nan_count = df.isna().sum()

nan_rows = df[df.isna().any(axis=1)]

"""##### A remoção desses valores realmente não terá um impacto negativo no dataset. Logo, é possível realizar a retirada deles tranquilamente

## Excluindo colunas com valores NAN
"""

df.dropna(subset=["annotator_educ", "annotator_income", "annotator_ideology", "annotator_age"], inplace=True)

df.drop(["comment_id", "annotator_id"], axis=1, inplace=True)

def calcular_limites_outliers(data):
    Q1 = data.quantile(0.25)  # primeiro quartil (25%)
    Q3 = data.quantile(0.75)  # terceiro quartil (75%)
    IQR = Q3 - Q1  # intervalo interquartil (IQR)
    limite_inferior = Q1 - 1.5 * IQR  # limite inferior para outliers
    limite_superior = Q3 + 1.5 * IQR  # limite superior para outliers
    return limite_inferior, limite_superior

for column in ["infitms", "outfitms", "annotator_severity", "std_err", "annotator_infitms", "annotator_outfitms", "hypothesis", "hate_speech_score"]:
    limite_inferior, limite_superior = calcular_limites_outliers(df[column])
    outliers = df[(df[column] < limite_inferior) | (df[column] > limite_superior)]
    if outliers.shape[0] < 1000:
        df = df[(df[column] >= limite_inferior) & (df[column] <= limite_superior)]

def remove_special(text):
    for char in text: #Removendo caracteres especiais
      if ord(char.upper()) not in range(65, 91) and ord(char) != 32:
        text = text.replace(char, "")
    return ''.join(char for char in text if char not in emoji.EMOJI_DATA)

df['clean_text'] = df['text'].apply(remove_special)

"""## Removendo as stopwords"""

#Converter a coluna em um array
textos = df['text'].values

def remove_stopwords(text):
      stop_words = set(stopwords.words('english'))
      words = text.split()
      filtered_words = [word for word in words if word.lower() not in stop_words]
      return ' '.join(filtered_words)

df['no_stopwords'] = df['clean_text'].apply(remove_stopwords)

bins = [-1000, -1, 1, 1000]
labels = ["Normal", "Neutral", "Hate Speech"]

df['hate_speech_score_binned'] = pd.cut(df['hate_speech_score'], bins=bins, labels=labels)

"""#### Codificação de label"""

# Codificar os rótulos
label_encoder = LabelEncoder()
df['label'] = label_encoder.fit_transform(df['hate_speech_score_binned'])

train_df, test_df = train_test_split(df, test_size=0.2, random_state=42)

nlp = spacy.load('en_core_web_sm')

def lemmatize_text(text):
    lemmatized_text = []
    for doc in nlp.pipe(text, batch_size=50, n_process=-1): # Usar a biblioteca spacy aplicar processamento paralelo reduziu o tempo de execução dessa parte pela metade
        lemmatized_text.append(' '.join([token.lemma_ for token in doc]))
    return lemmatized_text

train_df['lemmatized_text'] = lemmatize_text(train_df['no_stopwords'])
test_df['lemmatized_text'] = lemmatize_text(test_df['no_stopwords'])

tokenizer = get_tokenizer("basic_english")

def tokenize(text):
    return tokenizer(text)

# Aplicar a tokenização ao dataframe
train_df['tokens'] = train_df['lemmatized_text'].apply(tokenize)
test_df['tokens'] = test_df['lemmatized_text'].apply(tokenize)

"""### Aplicando One-Hot Encoder"""

#Usando pandas get_dummies para One-Hot Encoding
df_one_hot = pd.get_dummies(df, columns=['annotator_gender', 'annotator_trans', 'annotator_educ', 'annotator_ideology', 'annotator_income'])

def yield_tokens(data):
    for tokens in data:
        yield tokens

vocab = build_vocab_from_iterator(yield_tokens(train_df['tokens']), specials=["<unk>"])
vocab.set_default_index(vocab["<unk>"])

class HateSpeechDataset(Dataset):
    def __init__(self, df, vocab):
        self.df = df
        self.vocab = vocab

    def __len__(self):
        return len(self.df)

    def __getitem__(self, idx):
        tokens = self.df.iloc[idx]['tokens']
        label = self.df.iloc[idx]['label']
        token_ids = torch.tensor([self.vocab[token] for token in tokens], dtype=torch.long)
        return token_ids, label

train_dataset = HateSpeechDataset(train_df, vocab)
test_dataset = HateSpeechDataset(test_df, vocab)

def collate_fn(batch):
    texts, labels = zip(*batch)
    texts = pad_sequence(texts, batch_first=True, padding_value=vocab["<unk>"]).long()
    labels = torch.tensor(labels)
    return texts, labels

train_loader = DataLoader(train_dataset, batch_size=32, shuffle=True, collate_fn=collate_fn)
test_loader = DataLoader(test_dataset, batch_size=32, shuffle=False, collate_fn=collate_fn)

def calculate_metrics(outputs, labels):
    _, predicted = torch.max(outputs, 1)
    accuracy = accuracy_score(labels, predicted)
    precision = precision_score(labels, predicted, average='weighted')
    f1 = f1_score(labels, predicted, average='weighted')
    auc_roc = roc_auc_score(labels, nn.functional.softmax(outputs, dim=1), multi_class='ovr')
    return accuracy, precision, f1, auc_roc

class GRUModel(nn.Module):
    def __init__(self, vocab_size, num_hiddens, num_classes=3):
        super(GRUModel, self).__init__()
        self.embedding = nn.Embedding(vocab_size, num_hiddens)
        self.gru = nn.GRU(num_hiddens, num_hiddens, batch_first=True)
        self.fc = nn.Linear(num_hiddens, num_classes)

    def forward(self, inputs):
        embedded = self.embedding(inputs)
        output, _ = self.gru(embedded)
        output = self.fc(output[:, -1, :])  # Use the output of the last time step
        return output

for otimizador in ['Adam', 'SGD', 'RMSprop']:
    for lr in [0.0001, 0.001, 0.01]:
      for num_hiddens in [16, 32, 64]:

        print(f'Optimizer: {otimizador}, Learning Rate: {lr}, Number of Hidden Units: {num_hiddens}')
        num_inputs = len(vocab)
        gru_model = GRUModel(vocab_size=num_inputs, num_hiddens=num_hiddens)

        criterion = nn.CrossEntropyLoss()
        if otimizador == 'Adam':
            optimizer = torch.optim.Adam(gru_model.parameters(), lr=lr)
        elif otimizador == 'SGD':
            optimizer = torch.optim.SGD(gru_model.parameters(), lr=lr, momentum=0.9)
        elif otimizador == 'RMSprop':
            optimizer = torch.optim.RMSprop(gru_model.parameters(), lr=lr, alpha=0.9)
        num_epochs = 10 
        num_epochs = 10                                                             
        for epoch in range(num_epochs):
            gru_model.train()
            for inputs, labels in train_loader:
                outputs = gru_model(inputs)
                loss = criterion(outputs, labels)

                optimizer.zero_grad()
                loss.backward()
                optimizer.step()

            # Avaliação no conjunto de teste
            gru_model.eval()
            all_labels = []
            all_outputs = []
            with torch.no_grad():
                for inputs, labels in test_loader:
                    outputs = gru_model(inputs)
                    all_labels.extend(labels.cpu().numpy())
                    all_outputs.extend(outputs.cpu().numpy())

            all_labels = np.array(all_labels)
            all_outputs = np.array(all_outputs)
            accuracy, precision, f1, auc_roc = calculate_metrics(torch.tensor(all_outputs), torch.tensor(all_labels))
            print(f'Epoch {epoch+1}/{num_epochs}, Loss: {loss.item()}, Accuracy: {accuracy}, Precision: {precision}, F1-Score: {f1}, AUC-ROC: {auc_roc}')
