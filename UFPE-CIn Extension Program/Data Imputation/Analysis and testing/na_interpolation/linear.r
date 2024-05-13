#  Imputation by Linear Interpolation

library(imputeTS)

dataset_na <- tsAirgap

dataset_predicted <- na_interpolation(dataset, option="linear")

dataset_complete <- tsAirgapComplete

ggplot_na_imputations(dataset_na, dataset_predicted)

MAE <- mean(abs(dataset_predicted - dataset_complete)) # Mean Absolute Error 

MSE <- mean((dataset_predicted - dataset_complete)^2) # Mean Squared Error

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2)) # Root Mean Squared Error

print(paste("MAE:", MAE))
print(paste("MSE:", MSE))
print(paste("RMSE:", RMSE))
