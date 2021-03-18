Apple Stock Time Series Project

June 25 : • Uploaded the R file. I used ARIMA models to train the data, used validation and chose the model with least error to conduct the prediction.

Introduction:

The data collected is the apple stock data, the variables include Date, Opening Price, High Price of the Day, Low Price of the Day, Closing Price, Adjusted Closing Price, and Volume. The data was taken from Yahoo Finance. We are interested in exploring the properties of the open index of this dataset and determining if it has any time series properties.

Time Series Analysis:

From the raw plot, we may say that there is some kind of cyclical effect and does not have a trend until near the end.

Plotting the ACF against the lag for open , we see that the ACF tails off at a moderate rate and is significant till lag 71 .

After plotting the PACF against the lag for open , we see that the PACF is significant at lag 1.

Use Box-Pierce test to decide whether series appears to be realization from a white noise process. Since p-value is less than 2.2e-16 which is super small,  there is strong evidence that null hypothesis is false, so we reject null hypothesisthen that the series appears to be normalized , and so the series doesn't appear to be normalized (not a white noise process).

Apply first difference operator to the time series that might reasonably be expected to remove the non-stationary component. After applying the first difference, we can see that there is non-seasonal and no trend.

Use Box-Pierce test again, now the p-value is 0.8193>0.05, there is no evidence that null hypothesis is false, so we do not reject null hypothesis. Thus the new series is stationary and it is from a white noise process.

Split the first-diff dataset into train set and test set.

Try different ARMA models to find the least test error using training and test sets. (according to ARMA_3 models.png)

We use ARIMA(2,0,4), ARIMA(4,0,2), AR(2)

ARIMA(2,0,4): test error 3048.481, aic = 1010.41
ARIMA(4,0,2): test error 3017.495, aic = 1010.71 
AR(2):        test error 2994.125, aic = 1006.16

Choose AR(2) since the test error (sum of square error) and aic are both the smallest amoung the three ARIMA models.

We use AR(2) to predict the following two days (March 16, 2020 and March 17, 2020) opening price which are 265.4167 (true opening: 241.95)and 265.9059(true opening:247.51)respectively, error is approximately 7%.



Future Step: • Start to learn deep learning methods (LSTM) to train the dataset. It's going to be fun!
