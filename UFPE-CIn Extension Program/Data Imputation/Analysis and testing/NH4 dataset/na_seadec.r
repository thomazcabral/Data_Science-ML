# Seasonally Decomposed Missing Value Imputation

library(imputeTS)

dataset_na <- tsNH4

dataset_predicted <- na_seadec(dataset_na)

dataset_complete <- tsNH4Complete

ggplot_na_imputations(dataset_na, dataset_predicted)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 0.214769131268585
print(paste("MSE:", MSE)) # 0.677036874025055
print(paste("RMSE:", RMSE)) # 0.82282250456891
