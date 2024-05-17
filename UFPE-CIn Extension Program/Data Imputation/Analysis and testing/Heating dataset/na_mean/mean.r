# Missing Value Imputation by Mean Value

library(imputeTS)

dataset_na <- tsHeating

dataset_predicted <- na_mean(dataset_na, option="mean")

dataset_complete <- tsHeatingComplete

ggplot_na_distribution2(dataset_na)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 1.43376449343045
print(paste("MSE:", MSE)) # 32.4001551246945
print(paste("RMSE:", RMSE)) # 5.69211341460222
