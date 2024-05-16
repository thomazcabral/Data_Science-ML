# Missing Value Imputation by Simple Moving Average

library(imputeTS)

dataset_na <- tsNH4

dataset_predicted <- na_ma(dataset_na, weighting="simple")

dataset_complete <- tsNH4Complete

ggplot_na_imputations(dataset_na, dataset_predicted)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 0.337005701820915
print(paste("MSE:", MSE)) # 1.84441321761097
print(paste("RMSE:", RMSE)) # 1.35809175596164
