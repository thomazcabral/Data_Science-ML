# Imputation by ARIMA State Space Representation & Kalman Sm.

library(imputeTS)

dataset_na <- tsAirgap

dataset_predicted <- na_kalman(dataset, model="auto.arima")

dataset_complete <- tsAirgapComplete

ggplot_na_imputations(dataset_na, dataset_predicted)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 0.415033463319999
print(paste("MSE:", MSE)) # 3.060775609361
print(paste("RMSE:", RMSE)) # 1.74950724758745
