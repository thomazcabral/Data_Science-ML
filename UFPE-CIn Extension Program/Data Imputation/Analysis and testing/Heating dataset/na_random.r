# Missing Value Imputation by Random Sample

library(imputeTS)

dataset_na <- tsHeating

dataset_predicted <- na_random(dataset_na)

dataset_complete <- tsHeatingComplete

ggplot_na_distribution2(dataset_na)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 2.29099522302415
print(paste("MSE:", MSE)) # 82.6687129312432
print(paste("RMSE:", RMSE)) # 9.09223366017632
