# Missing Value Imputation by Median Value

library(imputeTS)

dataset_na <- tsAirgap

dataset_predicted <- na_mean(dataset, option="median")

dataset_complete <- tsAirgapComplete

ggplot_na_imputations(dataset_na, dataset_predicted)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 9.40277777777778
print(paste("MSE:", MSE)) # 1258.08333333333
print(paste("RMSE:", RMSE)) # 35.469470440554
