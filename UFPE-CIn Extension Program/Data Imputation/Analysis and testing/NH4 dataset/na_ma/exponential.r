# Missing Value Imputation by Exponential Moving Average

library(imputeTS)

dataset_na <- tsNH4

dataset_predicted <- na_ma(dataset_na, weighting="exponential")

dataset_complete <- tsNH4Complete

ggplot_na_imputations(dataset_na, dataset_predicted)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 0.293117698732522
print(paste("MSE:", MSE)) # 1.44666640300029
print(paste("RMSE:", RMSE)) # 1.20277446057035
