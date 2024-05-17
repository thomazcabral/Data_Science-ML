# Seasonally Splitted Missing Value Imputation

library(imputeTS)

dataset_na <- tsHeating

dataset_predicted <- na_seasplit(dataset_na)

dataset_complete <- tsHeatingComplete

ggplot_na_distribution2(dataset_na)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 1.08629915235549
print(paste("MSE:", MSE)) # 22.0105553325302
print(paste("RMSE:", RMSE)) # 4.69154082711961
