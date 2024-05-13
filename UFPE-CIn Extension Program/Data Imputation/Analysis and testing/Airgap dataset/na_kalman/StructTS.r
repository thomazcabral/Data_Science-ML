# Imputation by Structural Model & Kalman Smoothing

library(imputeTS)

dataset_na <- tsAirgap

dataset_predicted <- na_kalman(dataset, model="StructTS")

dataset_complete <- tsAirgapComplete

ggplot_na_imputations(dataset_na, dataset_predicted)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 0.745937547209365
print(paste("MSE:", MSE)) # 10.2919917407898
print(paste("RMSE:", RMSE)) # 3.20811342392842
