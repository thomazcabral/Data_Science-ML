# Seasonally Splitted Missing Value Imputation

library(imputeTS)

dataset_na <- tsAirgap

dataset_predicted <- na_seasplit(dataset_na)

dataset_complete <- tsAirgapComplete

ggplot_na_imputations(dataset_na, dataset_predicted)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 1.6875
print(paste("MSE:", MSE)) # 51.5590277777778
print(paste("RMSE:", RMSE)) # 7.18046152957996
