# Data Imputation

## Introduction

In many real-world scenarios, datasets often contain missing values, which can pose significant challenges for data analysis and predictive modeling. Addressing this issue, data imputation techniques are employed to estimate and
replace missing values, enabling the use of complete datasets for reliable analysis. This mini project explores various data imputation methods using the imputeTS library, from the R programming language, aiming to identify
the most effective techniques for different types of data and missing data patterns.  

The primary objective of this mini project is to analyze and compare the performance of several impuation algorithms on a selection of datasets. This analysis is crucial for our extension program, as it equips us with the
necessary skills and knowledge to handle incomplete data in a main dataset that we will only be able to take a look at in the future. By understanding the strengths and limitations of each imputation method, we can make informed
decisions when processing the main dataset, ensuring the accuracy and reliability of our results.

## Methodology

### Dataset Selection

The datasets used in this mini project were sourced from the imputeTS library, which provides some pre-processed univariate time series ideal for testing imputation algorithms. These datasets are duplicated in the library, one
has missing data, with NA values, and the other one is complete, therefore, helping the process of evaluating of the algorithms. These datasets vary in size, complexity and nature of data, offering a comprehensive basis for
evaluating different imputation techniques, and they are listed here:
- **tsAirgap**: The tsAirgap time series has 144 rows and the incomplete version includes 14 NA values. It represents the monthly totals of international airline passengers from 1949 to 1960;
- **tsNH4**: The tsNH4 time series has 4552 rows and the incomplete version includes 883 NA values. It represents the NH4 concentration in a waste-water system measured from 30.11.2010 - 16:10 to 01.01.2011 - 6:40 in 10 minute steps;
- **tsHeating**: The tsHeating time series has 606837 rows and the incomplete version includes 57391 NA values. It represents a heating systems’ supply temperature measured from 18.11.2013 - 05:12:00 to 13.01.2015 - 15:08:00 in 1 minute steps.

### Imputation Techniques

A diverse set of imputation algorithms were selected to provide a great comparison of methods:
- na_interpolation
  - Linear Interpolation: Imputes missing value by fitting a straight line between two known points and estimating the value at the missing point based on this line;
  - Spline Interpolation: Uses spline functions to fit a smooth curve through the known data points and estimate missing values. Splines are piecewise polynomials
    that ensure smoothness ate joints between intervals;
  - Stineman Interpolation: Imputes missing values using Stineman interpolationm which ensures monotonicity and smoothness. This method is less sensitive to abrupt changes in the data compared to a linear interpolation.
- na_kalman
  - StructTS: Imputes missing values using a structural time series model with Kalman smoothing. This method models the time series as a combination of trend, seasonality, and noise components;
  - auto.arima: Uses ARIMA (AutoRegressive Integrated Moving Average) models in state space representation combined with Kalman smoothing to estimate missing values. ARIMA models capture autocorrelation in the time series data.
- na_locf
  - locf (Last Observation Carried Forward): Imputes missing values by carrying forward the last observed value before the missing data. It assumes that the most recent observation is a good estimate for the missing value;
  - nocb (Next Observation Carried Backward): Imputes missing values by carrying backward the next observed value after the missing data. It uses the next known value as the estimate for the missing value.
- na_ma
  - Simple Moving Average: Imputes missing values by taking the average of a fixed number of neighboring observations. It smooths out short-term fluctuations;
  - Linear Weighted Moving Average: Uses weights that decrease linearly for older observations. This method gives more importance to recent data points when imputing missing values;
  - Exponential Weighted Moving Average: Applies exponentially decreasing weights to older observations, placing more emphasis on recent values. This method responds more quickly to changes in the data.
- na_mean
  - Mean Value: Imputes missing values by replacing them with the mean of the observed values in the dataset;
  - Median Value: Replaces missing values with the median of the observed values. This method is robust to outliers;
  - Mode Value: Uses the mode, or the most frequently occurring value, to impute missing data. This method is suitable for categorical data.
- na_random: Imputes missing values by randomly selecting observed values from the same dataset.

### Evaluation Criteria

In order to evaluate the performance of each impuation method, the following metrics were used:
- Mean Absolute Error (MAE): Measures the average magnitude of errors between imputed and actual values;
- Mean Squared Error (MSE): While still measuring the average values, takes the outliers more into consideration;
- Root Mean Squared Error (RMSE): Measures the square root of the average of squared differences between imputed and actual values.

### Implementation Steps

The following steps outline the procedure used to implement the imputation methods:
1. Load the Datasets: Importing the selected datasets from the imputeTS library;
2. Apply Imputation Methods: Using each imputation method on the datasets using the imputeTS package;
3. Evaluate Results: Assessing the imputed values using the defined metrics and performing visual inspection;
4. Compare Performance: Comparing the performance of the imputation methods to determine the most effective technique for each dataset.

## Results and Discussion

### Evaluation Summary

To provide a clear comparison of the imputation methods, the following table summarizes the performance metricsfor each algorithm across the different datasets. This allows for a quick assessment of which methods 
performed best under various conditions.

| Dataset  | Algorithm               | MAE   | MSE   | RMSE  | 
|----------|-------------------------|-------|-------|-------|
| tsAirgap | Linear Interpolation    | 1.565 | 37.066 | 6.088 |
|          | Spline Interpolation    | 1.397 | 30.294 | 5.504 |
|          | Stineman Interpolation  | 1.508 | 36.476 | 6.039 |
|          | Kalman (StructTS)       | 0.745 | 10.291 | 3.208 |
|          | Kalman (auto.arima)     | 0.415 | 3.060 | 1.749 |
|          | LOCF                    | 2.812 | 113.534 | 10.655 |
|          | NOCB                    | 3.173 | 142.048 | 11.918 |
|          | Moving Average (Simple) | 2.366 | 93.564 | 9.672 |
|          | Moving Average (Linear) | 2.046 | 72.929 | 8.539 |
|          | Moving Average (Exp)    | 1.919 | 65.476 | 8.091 |
|          | Mean Imputation         | 8.899 | 1198.900 | 34.625 |
|          | Median Imputation       | 9.402 | 1258.083 | 35.469 |
|          | Mode Imputation         | 10.444 | 1481.000 | 38.483 |
|          | Random Sample*          | 17.432 | 4803.217 | 69.305 |
| tsNH4    | Linear Interpolation    | 0.262 | 1.128 | 1.062 |
|          | Spline Interpolation    | 0.490 | 4.224 | 2.055 |
|          | Stineman Interpolation  | 0.291 | 1.341 | 1.158 |
|          | Kalman (StructTS)**     | - | - | - |
|          | Kalman (auto.arima)     | 0.204 | 0.490 | 0.700 |
|          | LOCF                    | 0.449 | 4.027 | 2.006 |
|          | NOCB                    | 0.470 | 3.691 | 1.921 |
|          | Moving Average (Simple) | 0.337 | 1.844 | 1.358 |
|          | Moving Average (Linear) | 0.300 | 1.448 | 1.203 |
|          | Moving Average (Exp)    | 0.293 | 1.446 | 1.202 |
|          | Mean Imputation         | 1.438 | 14.323 | 3.784 |
|          | Median Imputation       | 1.399 | 13.587 | 3.686 |
|          | Mode Imputation         | 1.300 | 13.219 | 3.635 |
|          | Random Sample*          | 3.460 | 91.673 | 9.574 |
| tsHeating| Linear Interpolation    | 0.377 | 5.732 | 2.394 |
|          | Spline Interpolation    | 0.684 | 31.817 | 5.640 |
|          | Stineman Interpolation  | 0.362 | 6.018 | 2.453  |
|          | Kalman (StructTS)**     | - | - | - |
|          | Kalman (auto.arima)**   | - | - | - |
|          | LOCF                    | 0.627 | 11.835 | 3.440 |
|          | NOCB                    | 0.649 | 12.576 | 3.546 |
|          | Moving Average (Simple) | 0.460 | 7.935 | 2.816 |
|          | Moving Average (Linear) | 0.458 | 7.900 | 2.810 |
|          | Moving Average (Exp)    | 0.454 | 7.834 | 2.799 |
|          | Mean Imputation         | 1.433 | 32.400 | 5.692 |
|          | Median Imputation       | 1.444 | 33.595 | 5.796 |
|          | Mode Imputation         | 2.093 | 72.401 | 8.508 |
|          | Random Sample*          | 2.290 | 82.668 | 9.092 |

Observations:  
*The Random Sample technique is a non-deterministic algorithm; since the method relies on random selection, **the imputed values can vary** each time the algorithm is run.  
**The Kalman algorithm analyze many features of the data and therefore is **very slow** when applied to **big datasets**, which were the case of the last 2 datasets.
