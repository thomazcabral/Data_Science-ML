# Imputation by Stineman Interpolation

library(imputeTS)

dataset_na <- tsAirgap

dataset_predicted <- na_interpolation(dataset, option="stine")

dataset_complete <- tsAirgapComplete

ggplot_na_imputations(dataset_na, dataset_predicted)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 1.50851276050018
print(paste("MSE:", MSE)) # 36.4763105436244
print(paste("RMSE:", RMSE)) # 6.03956211522196
