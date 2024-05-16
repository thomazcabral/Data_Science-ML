# Imputation by Linear Interpolation

library(imputeTS)

dataset_na <- tsNH4

dataset_predicted <- na_random(dataset_na)

dataset_complete <- tsNH4Complete

ggplot_na_imputations(dataset_na, dataset_predicted)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 3.50670907624466
print(paste("MSE:", MSE)) # 93.5046113947801
print(paste("RMSE:", RMSE)) # 9.66977824951431
