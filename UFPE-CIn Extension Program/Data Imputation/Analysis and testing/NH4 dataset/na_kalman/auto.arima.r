# Imputation by ARIMA State Space Representation & Kalman Sm.

library(imputeTS)

dataset_na <- tsNH4

dataset_predicted <- na_kalman(dataset_na, model="auto.arima")

dataset_complete <- tsNH4Complete

ggplot_na_imputations(dataset_na, dataset_predicted)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 0.204113619809738
print(paste("MSE:", MSE)) # 0.490415714066798
print(paste("RMSE:", RMSE)) # 0.700296875665455
