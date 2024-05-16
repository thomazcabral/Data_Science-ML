# Imputation by Next Observation Carried Backward

library(imputeTS)

dataset_na <- tsNH4

dataset_predicted <- na_locf(dataset_na, option="nocb")

dataset_complete <- tsNH4Complete

ggplot_na_imputations(dataset_na, dataset_predicted)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 0.470506156923504
print(paste("MSE:", MSE)) # 3.69147676261735
print(paste("RMSE:", RMSE)) # 1.92132161873471
