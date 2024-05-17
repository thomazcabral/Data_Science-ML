# Missing Value Imputation by Simple Moving Average

library(imputeTS)

dataset_na <- tsHeating

dataset_predicted <- na_ma(dataset_na, weighting="simple")

dataset_complete <- tsHeatingComplete

ggplot_na_distribution2(dataset_na)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 0.460896095931307
print(paste("MSE:", MSE)) # 7.93542371648218
print(paste("RMSE:", RMSE)) # 2.81698841255732
