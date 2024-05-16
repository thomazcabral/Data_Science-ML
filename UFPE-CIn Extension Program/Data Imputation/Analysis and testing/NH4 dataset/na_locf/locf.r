# Imputation by Last Observation Carried Forward

library(imputeTS)

dataset_na <- tsNH4

dataset_predicted <- na_locf(dataset_na, option="locf")

dataset_complete <- tsNH4Complete

ggplot_na_imputations(dataset_na, dataset_predicted)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 0.449957570221688
print(paste("MSE:", MSE)) # 4.02760278171056
print(paste("RMSE:", RMSE)) # 2.00688883142803
