# Missing Value Imputation by Mode Value

library(imputeTS)

dataset_na <- tsHeating

dataset_predicted <- na_mean(dataset_na, option="mode")

dataset_complete <- tsHeatingComplete

ggplot_na_distribution2(dataset_na)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 2.09362777813482
print(paste("MSE:", MSE)) # 72.4017288332782
print(paste("RMSE:", RMSE)) # 8.50892054453902
