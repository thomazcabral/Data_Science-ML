# Missing Value Imputation by Simple Moving Average

library(imputeTS)

dataset_na <- tsAirgap

dataset_predicted <- na_ma(dataset, weighting="simple")

dataset_complete <- tsAirgapComplete

ggplot_na_imputations(dataset_na, dataset_predicted)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 2.36689814814815
print(paste("MSE:", MSE)) # 93.5643256723986
print(paste("RMSE:", RMSE)) # 9.67286543235243
