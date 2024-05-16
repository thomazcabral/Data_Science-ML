# Imputation by Linear Interpolation

library(imputeTS)

dataset_na <- tsNH4

dataset_predicted <- na_interpolation(dataset_na, option="linear")

dataset_complete <- tsNH4Complete

ggplot_na_imputations(dataset_na, dataset_predicted)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 0.262493827989112
print(paste("MSE:", MSE)) # 1.12897361321934
print(paste("RMSE:", RMSE)) # 1.06253169986563
