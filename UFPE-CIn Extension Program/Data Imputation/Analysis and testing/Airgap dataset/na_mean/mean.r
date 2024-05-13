# Missing Value Imputation by Mean Value

library(imputeTS)

dataset_na <- tsAirgap

dataset_predicted <- na_mean(dataset, option="mean")

dataset_complete <- tsAirgapComplete

ggplot_na_imputations(dataset_na, dataset_predicted)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 8.89965012722646
print(paste("MSE:", MSE)) # 1198.90268025368
print(paste("RMSE:", RMSE)) # 34.625174082648
