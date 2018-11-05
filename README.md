# Stock Prediction With R:

   The objective of this Project is to develop stock earning driver model and predicting the stock market earning of top 200 companies for the next 12 months for ASX (Australian Stock Exchange). The primary purpose of this project is to identify the the critical drivers of individual stocks earnings, such as Iron Ore prices and FX-Rates for FMG-AU, Oil prices, interest rates, consumer sentiment for QAN-AU, Oil+ Coal+ LNG+ wholesale energy prices + temperature + solar panel take-up rates for ORG-AU using R to predict the stock market for next year. However, due to lack of time period, I can build it with just three external variables i.e., Aluminium, Cobalt, and Copper using XgBoost.
    This is an example of stock prediction with R using ETFs of which the stock is a composite. To get rid of seasonality in the data, we used technical indicators like RSI, ADX and Parabolic SAR that more or less showed stationarity. The goal of the project is to predict if the stock price today will go higher or lower than yesterday. This work was done as a iLab project for the course: Master of Data Science and Innovation at University of Technology Sydney and with the support of J.P. Morgan.

## Packages Required

* xgboost
* quantmod
* highcharter
* psych
* pROC 

All the Packages are downloaded from CRAN Repository. 

### Prerequisites

* Knowledge of R Programming
* R Studio

Data used in this project is obtained from Yahoo Finance API using *quantmod* built in function `getSymbols()`. This gives us data in the form of time series xts objects. Using the `last()` function we can specify our time range. I'm using the last 5 years of data for this project as some companies are established and listed in last five years.
The following stocks/ETFs were used:
* Response Variables: ANZ Bank - Open, Close  
* Predictor Variables: Predicted variable are more than 175 companies from ASX with different industries.

A keen observer would note that all the 175 Predictor variables are relate to banking, manufacture, materials, information technolgy,energy, consumer staples, real estate, telecommunication services, health care and finance stocks. ANZ is composite of all the three above funds.

## Visualisation of Price History


The __highcharter__ library is a brilliant tool for generating visually appeasing and interactive charts. Although it's free for non-commercial/academic use, it requires a license for commercial use though. 

The following chart was generated using highcharter.

<img src="https://github.com/ujashleuva/ASXStockMarketPrediction/blob/master/Rplot02.png" alt="Drawing" style="width:100%;"/>

## Prediction Model Description

Our goal in this project is to use ETFs to predict the value of one composite stock. The premise for this is that, we can think of an ETF as a representative for the entire industry. Banking and financial firms are all pretty much correlated to each other as even a minor policy change could potentially affect all of them. Thus, by using the performance of the ETF to train our Machine Learning models, we can arrive at a healthy and reasonable prediction for target stock : __ANZ__









