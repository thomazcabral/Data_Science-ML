# Missing Value Imputation by Linear Moving Average

library(imputeTS)

dataset_na <- tsHeating

dataset_predicted <- na_ma(dataset_na, weighting="linear")

dataset_complete <- tsHeatingComplete

ggplot_na_distribution2(dataset_na)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 0.458460851959605
print(paste("MSE:", MSE)) # 7.90046001550219
print(paste("RMSE:", RMSE)) # 2.81077569640521
