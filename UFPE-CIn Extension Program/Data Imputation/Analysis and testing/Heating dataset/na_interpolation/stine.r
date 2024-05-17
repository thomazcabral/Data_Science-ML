# Imputation by Stineman Interpolation

library(imputeTS)

dataset_na <- tsHeating

dataset_predicted <- na_interpolation(dataset_na, option="stine")

dataset_complete <- tsHeatingComplete

ggplot_na_distribution2(dataset_na)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 0.362937575670451
print(paste("MSE:", MSE)) # 6.01829225932655
print(paste("RMSE:", RMSE)) # 2.45322079302425
