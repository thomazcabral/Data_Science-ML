# Missing Value Imputation by Mode Value

library(imputeTS)

dataset_na <- tsAirgap

dataset_predicted <- na_mean(dataset, option="mode")

dataset_complete <- tsAirgapComplete

ggplot_na_imputations(dataset_na, dataset_predicted)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 10.4444444444444
print(paste("MSE:", MSE)) # 1481
print(paste("RMSE:", RMSE)) # 38.4837628097877
