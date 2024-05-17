# Imputation by Next Observation Carried Backward

library(imputeTS)

dataset_na <- tsHeating

dataset_predicted <- na_locf(dataset_na, option="nocb")

dataset_complete <- tsHeatingComplete

ggplot_na_distribution2(dataset_na)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 0.649311100015326
print(paste("MSE:", MSE)) # 12.5763426093004
print(paste("RMSE:", RMSE)) # 3.54631394680453
