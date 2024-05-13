# Missing Value Imputation by Linear Weighted Moving Average

library(imputeTS)

dataset_na <- tsAirgap

dataset_predicted <- na_ma(dataset, weighting="linear")

dataset_complete <- tsAirgapComplete

ggplot_na_imputations(dataset_na, dataset_predicted)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 2.04647532234202
print(paste("MSE:", MSE)) # 72.9296914958321
print(paste("RMSE:", RMSE)) # 8.53988826014908
