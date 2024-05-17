# Imputation by Last Observation Carried Forward

library(imputeTS)

dataset_na <- tsHeating

dataset_predicted <- na_locf(dataset_na, option="locf")

dataset_complete <- tsHeatingComplete

ggplot_na_distribution2(dataset_na)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 0.627217028625479
print(paste("MSE:", MSE)) # 11.8356427673329
print(paste("RMSE:", RMSE)) # 3.44029690104399
