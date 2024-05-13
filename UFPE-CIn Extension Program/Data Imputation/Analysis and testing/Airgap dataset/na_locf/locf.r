# Imputation by Last Observation Carried Forward

library(imputeTS)

dataset_na <- tsAirgap

dataset_predicted <- na_locf(dataset, option="locf")

dataset_complete <- tsAirgapComplete

ggplot_na_imputations(dataset_na, dataset_predicted)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 2.8125
print(paste("MSE:", MSE)) # 113.534722222222
print(paste("RMSE:", RMSE)) # 10.6552673463514
