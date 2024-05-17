# Imputation by Spline Interpolation

library(imputeTS)

dataset_na <- tsHeating

dataset_predicted <- na_interpolation(dataset_na, option="spline")

dataset_complete <- tsHeatingComplete

ggplot_na_distribution2(dataset_na)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 0.684362636875336
print(paste("MSE:", MSE)) # 31.8172679527999
print(paste("RMSE:", RMSE)) # 5.64067974208782
