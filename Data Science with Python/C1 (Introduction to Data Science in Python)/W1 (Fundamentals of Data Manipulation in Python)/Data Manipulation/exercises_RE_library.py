import re

# Question 1
# Capture words that start with a vowel letter (aeiou), but ends with a non-vowel letter. 
#There can be 0 or more letters in between. 
#Also, it is not allowed to have other characters besides letter in between. 
#e.g. your regular expression should match unicorn, element, but should not match: banana, apple. 
#All letters are lowercase.

str_input = input()
if(re.search("^[aeiou][\w]*[^aeiou]$",str_input)): # starts with vogal and ends with non-vogal
    print("Match!")
else:
    print("Does not match")

# Question 2
# Capture numbers in octal or hexadecimal representation in Python.
# Octal numbers start with a prefix "0o" (number zero followed by lowercase letter o), and are followed by one or more numbers in the range of 0 to 7.
# E.g. 0o112, 0o237, 0o07.
# Hexadecimal numbers start with a prefix "0x", and are followed by one or more numbers in the range of 0 to 9 or lowercase letters in the range of a to f.
#E.g. 0xf3, 0x1d, 0x072.

number = input()
if(re.fullmatch("0o[0-7]+", number)):
    print("Octal")
elif(re.fullmatch("0x[0-9a-f]+", number)):
    print("Hexadecimal")
else:
    print("None of them")

# Question 3
# Capture a "Firstname Lastname" at the beginning of each line.
# e.g. for sentence Jane Doe is eating breakfast. Your regex should capture "Jane Doe".
# But in sentence Today is John Doe's birthday. Your regex should NOT capture the name in the sentence as it does not start from the beginning of the string.
# Notice that the name should consist of two words. Each word should start with a capital letter and has zero or more lowercase letters followed.
# No other symbols are allowed in the name.
# Some valid names are: Issac Newton, L Zhang;
# Some invalid names are: john doe, Ling-Ling Li.

sentence = input()
splited_sentence = re.split("\s", sentence, 2)
print("Valid!") if re.fullmatch("[A-Z][\w]*", splited_sentence[0]) and re.fullmatch("[A-Z][\w]*", splited_sentence[1]) else print("Invalid")

# Question 4
# Match any price in the form $3.45 or $23.32 or $400. Your regex should capture strings meeting the following requirements:
# Start with a "$" sign;
# The price should be an integer, or have exactly two digits after the decimal point.

price = input()
splited = re.split("\.", price)
print("Valid!") if re.fullmatch("[$][\d]+", splited[0]) and (len(splited) == 1 or (re.fullmatch("[\d]{2}", splited[1]))) else print("Invalid")

# Question 5
# Capture email address with letters, numbers, underscore and dots.
# A valid email address defined in this problem must meet the following requirements:
# Has an "@" symbol;
# Before the "@" symbol, there can be one or more strings made of letters, numbers and underscores, separated by a single dot.
# After the "@" symbol, there can two or more strings made of letters, numbers and underscores, separated by a single dot.
# No other characters besides letters, numbers, underscores, dots, and the "@" symbol should appear in the email address.
# For example, your regular expression should match email addresses like: abc@umich.edu, 8ab.c_def9@example.regex.com;
# But your regex should not match: abc@ def., ab..abc@def.com, abc@def
# Regular expression pattern for a valid email address

email = input()
email_pattern = r'^[a-zA-Z0-9_]+(\.[a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+(\.[a-zA-Z0-9_]+)+$'
print("Valid!") if re.match(email_pattern, email) else print("Invalid")
