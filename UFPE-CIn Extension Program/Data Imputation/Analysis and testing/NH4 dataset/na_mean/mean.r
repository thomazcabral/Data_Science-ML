# Missing Value Imputation by Mean Value

library(imputeTS)

dataset_na <- tsNH4

dataset_predicted <- na_mean(dataset_na, option="mean")

dataset_complete <- tsNH4Complete

ggplot_na_imputations(dataset_na, dataset_predicted)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 1.43835098986393
print(paste("MSE:", MSE)) # 14.3238601188101
print(paste("RMSE:", RMSE)) # 3.78468758536423
