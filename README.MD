# Stock Prediction With R
  The objective of this Project is to develop stock earning driver model and predicting the stock market earning of top 200 companies for the next 12 months for ASX (Australian Stock Exchange). The primary purpose of this project is to identify the the critical drivers of individual stocks earnings, such as Iron Ore prices and FX-Rates for FMG-AU, Oil prices, interest rates, consumer sentiment for QAN-AU, Oil+ Coal+ LNG+ wholesale energy prices + temperature + solar panel take-up rates for ORG-AU using R to predict the stock market for next year. However, due to lack of time period, I can build it with just three external variables i.e., Aluminium, Cobalt, and Copper using XgBoost. 
  This is an example of stock prediction with R using ETFs of which the stock is a composite. To get rid of seasonality in the data, we used technical indicators like RSI, ADX and Parabolic SAR that more or less showed stationarity. The goal of the project is to predict if the stock price today will go higher or lower than yesterday. This work was done as a iLab project for the course: Master of Data Science and Innovation at University of Technology Sydney and with the support of J.P. Morgan.


## Packages Required
xgboost
quantmod
highcharter
psych
pROC
All the Packages are downloaded from CRAN Repository.

### Prerequisites
Knowledge of R Programming
R Studio

## Dataset Description
Data used in this project is obtained from Yahoo Finance API using quantmod built in function getSymbols(). This gives us data in the form of time series xts objects. Using the last() function we can specify our time range. I'm using the last 5 years of data for this project as some companies are established and listed in last five years. The following stocks/ETFs were used:

* Response Variables: ANZ Bank - Open, Close
* Predictor Variables: There are around 175 companies took it as a predictor variables.

A keen observer would note that all the 175 Predictor variables are ETFs that relate to Banking, Manufactor, Information Technology, Consumer goods, Real Estate, Materials, Health care and Finance stocks. ANZ is composite of all above funds.

From the sector and industries as per the 2018 market cap, Financials and Material sectors are stand out in market caps. 

<img src="https://github.com/ujashleuva/ASXStockMarketPrediction/blob/master/Picture1.jpg" alt="Drawing" style="width:100%;"/>

## Visualisation of Price History
The __highcharter__ library is a brilliant tool for generating visually appeasing and interactive charts. Although it's free for non-commercial/academic use, it requires a license for commercial use though.

The following chart was generated using highcharter.

<img src="https://github.com/ujashleuva/ASXStockMarketPrediction/blob/master/Rplot02.png" alt="Drawing" style="width:100%;"/>

## Prediction Model Description

Our goal in this project is to use ETFs to predict the value of one composite stock. The premise for this is that, we can think of an ETF as a representative for the entire industry. All the firms are all pretty much correlated to each other as even a minor policy change could potentially affect all of them. Thus, by using the performance of the ETF to train our Machine Learning models, we can arrive at a healthy and reasonable prediction for target stock : __ANZ__

For commodities, myself took 'Aluminium (AL)' as a target commodities with the comparision of Cobalt (CB) and Copper (CP) from London Matel Exchange. 

One common mistake in using time series data is that the data tends to exhibit seasonality and to arrive at an accurate measure, we need to convert it into a stationary data. Check out this article by Vegard Flovik where he talks more about this [https://www.linkedin.com/pulse/how-use-machine-learning-time-series-forecasting-vegard-flovik-phd/](https://www.linkedin.com/pulse/how-use-machine-learning-time-series-forecasting-vegard-flovik-phd/)

One way we can go about doing this is differencing the data. But since this is financial data, the _quantmod_ package has a lot technical indicator functions which we can use to generate indicator data that more or less gets rid of seasonality.

Some of the indicators, we have used are:

RSI - Relative Stregth Index (A measure of how the stock performed scaled to 0-100 w.r.t the Weighted Moving Average)
(There are more than 175 firms therefore I can not post all the RSI for individual firms).

<img src="https://github.com/ujashleuva/ASXStockMarketPrediction/blob/master/rsiCBA.jpeg" alt="Drawing" style="width:100%;"/>


ADX - Average Directional Indicator

<img src="https://github.com/ujashleuva/ASXStockMarketPrediction/blob/master/adxCBA.jpeg" alt="Drawing" style="width:100%;"/>

Parabolic SAR Trend- Stop and Reverse Indicator

<img src="https://github.com/ujashleuva/ASXStockMarketPrediction/blob/master/trendCBA.jpeg" alt="Drawing" style="width:100%;"/>

After munging out all the numbers for the indicators, we then feed it into our model. We also incorporate a lag of 1 day to avoid a lookahead bias on the data.

## Machine Learning Algorithm

We will be using the xgboost algorithm with the goal of binary logistic regression. After data preparation into training (_approx 70%_ )and test (_approx 30%_) sets, we then feed it to the algorithm. 

Here's the ROC Curve for our first run on 10 rounds. 

<img src="https://github.com/ujashleuva/ASXStockMarketPrediction/blob/master/Sensitivity-Specificity.jpeg" alt="Drawing" style="width:100%;"/>











                                                                                                                          
                                                                                                                    
                                                                                                                          
                                                                                                                          



