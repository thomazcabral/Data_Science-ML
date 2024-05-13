#

library(imputeTS)

dataset_na <- tsAirgap

dataset_predicted <- na_ma(dataset, weighting="exponential")

dataset_complete <- tsAirgapComplete

ggplot_na_imputations(dataset_na, dataset_predicted)

MAE <- mean(abs(dataset_predicted - dataset_complete))

MSE <- mean((dataset_predicted - dataset_complete)^2)

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2))

print(paste("MAE:", MAE)) # 1.91902463755912
print(paste("MSE:", MSE)) # 65.4762571339605
print(paste("RMSE:", RMSE)) # 8.09174005600529
