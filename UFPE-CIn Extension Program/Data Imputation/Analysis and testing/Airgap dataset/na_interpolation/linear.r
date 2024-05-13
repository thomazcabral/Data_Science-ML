#  Imputation by Linear Interpolation

library(imputeTS)

dataset_na <- tsAirgap

dataset_predicted <- na_interpolation(dataset, option="linear")

dataset_complete <- tsAirgapComplete

ggplot_na_imputations(dataset_na, dataset_predicted)

MAE <- mean(abs(dataset_predicted - dataset_complete)) # Mean Absolute Error 

MSE <- mean((dataset_predicted - dataset_complete)^2) # Mean Squared Error

RMSE <- sqrt(mean((dataset_predicted - dataset_complete)^2)) # Root Mean Squared Error

print(paste("MAE:", MAE)) # 1.39707190361673
print(paste("MSE:", MSE)) # 30.2940495582614
print(paste("RMSE:", RMSE)) # 5.50400304853307
