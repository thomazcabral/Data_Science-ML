# Imputation by Linear Interpolation

library(imputeTS)

dataset_na <- tsHeating

dataset_predicted <- na_interpolation(dataset_na, option="linear")

dataset_complete <- tsHeatingComplete

ggplot_na_distribution2(dataset_na)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 0.377901816906592
print(paste("MSE:", MSE)) # 5.73285270136059
print(paste("RMSE:", RMSE)) # 2.39433763311706
