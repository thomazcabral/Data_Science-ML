# Missing Value Imputation by Median Value

library(imputeTS)

dataset_na <- tsHeating

dataset_predicted <- na_mean(dataset_na, option="median")

dataset_complete <- tsHeatingComplete

ggplot_na_distribution2(dataset_na)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 1.44476028983071
print(paste("MSE:", MSE)) # 33.5953420111166
print(paste("RMSE:", RMSE)) # 5.79614889483669
