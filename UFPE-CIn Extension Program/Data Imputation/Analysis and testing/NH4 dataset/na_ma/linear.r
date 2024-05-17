# Missing Value Imputation by Linear Moving Average

library(imputeTS)

dataset_na <- tsNH4

dataset_predicted <- na_ma(dataset_na, weighting="linear")

dataset_complete <- tsNH4Complete

ggplot_na_imputations(dataset_na, dataset_predicted)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 0.300680273600318
print(paste("MSE:", MSE)) # 1.44887884887554
print(paste("RMSE:", RMSE)) # 1.20369383519047
