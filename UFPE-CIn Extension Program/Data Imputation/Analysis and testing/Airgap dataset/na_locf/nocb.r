# Imputation by Next Observation Carried Backward

library(imputeTS)

dataset_na <- tsAirgap

dataset_predicted <- na_locf(dataset, option="nocb")

dataset_complete <- tsAirgapComplete

ggplot_na_imputations(dataset_na, dataset_predicted)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 3.17361111111111
print(paste("MSE:", MSE)) # 142.048611111111
print(paste("RMSE:", RMSE)) # 11.9184147901938
