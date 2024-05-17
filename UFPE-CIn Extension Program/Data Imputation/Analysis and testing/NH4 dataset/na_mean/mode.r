# Missing Value Imputation by Mode Value

library(imputeTS)

dataset_na <- tsNH4

dataset_predicted <- na_mean(dataset_na, option="mode")

dataset_complete <- tsNH4Complete

ggplot_na_imputations(dataset_na, dataset_predicted)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 1.30095432988777
print(paste("MSE:", MSE)) # 13.2192973920514
print(paste("RMSE:", RMSE)) # 3.63583517118851
