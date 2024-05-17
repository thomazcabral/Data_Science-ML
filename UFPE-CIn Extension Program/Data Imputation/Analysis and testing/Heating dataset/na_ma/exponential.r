# Missing Value Imputation by Exponential Moving Average

library(imputeTS)

dataset_na <- tsHeating

dataset_predicted <- na_ma(dataset_na, weighting="exponential")

dataset_complete <- tsHeatingComplete

ggplot_na_distribution2(dataset_na)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 0.454152802015641
print(paste("MSE:", MSE)) # 7.83477185951355
print(paste("RMSE:", RMSE)) # 2.79906624778935
