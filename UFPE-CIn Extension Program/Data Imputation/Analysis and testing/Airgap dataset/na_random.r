# Missing Value Imputation by Random Sample

library(imputeTS)

dataset_na <- tsAirgap

dataset_predicted <- na_random(dataset)

dataset_complete <- tsAirgapComplete

ggplot_na_imputations(dataset_na, dataset_predicted)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 17.4325863634327
print(paste("MSE:", MSE)) # 4803.21717198129
print(paste("RMSE:", RMSE)) # 69.3052463525042
