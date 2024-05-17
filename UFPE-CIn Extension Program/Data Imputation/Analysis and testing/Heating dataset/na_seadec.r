# Seasonally Decomposed Missing Value Imputation

library(imputeTS)

dataset_na <- tsHeating

dataset_predicted <- na_seadec(dataset_na)

dataset_complete <- tsHeatingComplete

ggplot_na_distribution2(dataset_na)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 0.445488214210209
print(paste("MSE:", MSE)) # 7.09129318459768
print(paste("RMSE:", RMSE)) # 2.66294821290195
