# Imputation by Stineman Interpolation

library(imputeTS)

dataset_na <- tsNH4

dataset_predicted <- na_interpolation(dataset_na, option="stine")

dataset_complete <- tsNH4Complete

ggplot_na_imputations(dataset_na, dataset_predicted)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 0.291691125619174
print(paste("MSE:", MSE)) # 1.34194874325928
print(paste("RMSE:", RMSE)) # 1.15842511335834
