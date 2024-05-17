# Missing Value Imputation by Random Sample

library(imputeTS)

dataset_na <- tsNH4

dataset_predicted <- na_random(dataset_na)

dataset_complete <- tsNH4Complete

ggplot_na_imputations(dataset_na, dataset_predicted)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 3.46027145990981
print(paste("MSE:", MSE)) # 91.6731712466606
print(paste("RMSE:", RMSE)) # 9.57461076214906
