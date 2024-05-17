# Missing Value Imputation by Median Value

library(imputeTS)

dataset_na <- tsNH4

dataset_predicted <- na_mean(dataset_na, option="median")

dataset_complete <- tsNH4Complete

ggplot_na_imputations(dataset_na, dataset_predicted)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 1.39943518079579
print(paste("MSE:", MSE)) # 13.5879634677279
print(paste("RMSE:", RMSE)) # 3.68618549014126
