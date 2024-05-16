# Imputation by Spline Interpolation

library(imputeTS)

dataset_na <- tsNH4

dataset_predicted <- na_interpolation(dataset_na, option="spline")

dataset_complete <- tsNH4Complete

ggplot_na_imputations(dataset_na, dataset_predicted)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 0.490426807787767
print(paste("MSE:", MSE)) # 4.22451299185708
print(paste("RMSE:", RMSE)) # 2.05536200992844
