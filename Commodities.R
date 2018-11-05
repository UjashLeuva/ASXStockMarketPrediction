
library(quantmod)
library(flexdashboard)
library(FinCal)
library(TTR)
library(ggplot2)
library(data.table)
library(dplyr)
library(dygraphs)
library(Quandl)
library(xgboost)
library(xts)


library(PerformanceAnalytics)




# Gold <- Quandl("LBMA/GOLD",start_date="2013-09-28",collapse="monthly")
# COBALT <- Quandl("LME/PR_CO",start_date="2013-09-28",collapse="monthly")


ALUMINIUM <- Quandl("LME/ST_PA_ALL",start_date="2013-09-28",api_key="5mNxkW3BNyBmN8psqo6-",collapse="monthly", type='xts') #Taking last 5 year of data
COBALT <- Quandl("LME/ST_CO_ALL",start_date="2013-09-28", api_key="5mNxkW3BNyBmN8psqo6-",collapse="monthly",type='xts') #Taking last 5 year of data
COPPER <-  Quandl("LME/ST_CU_ALL", start_date="2013-09-28",api_key="5mNxkW3BNyBmN8psqo6-",collapse="monthly",type='xts')
#STEEL <-  Quandl("LME/ST_SB_ALL",start_date="2013-09-28",collapse="monthly",api_key="5mNxkW3BNyBmN8psqo6-")


#AUD <-  Quandl("CUR/AUD", api_key="5mNxkW3BNyBmN8psqo6-",start_date="2013-09-28",collapse="monthly",type='xts')





# Create a chart of returns
#charts.PerformanceSummary(returns, main = "ETF Returns Chart")

#Time series visualisation for commodity
# Cobalt_ts <- plot.ts(COBALT, main = "COBALT Price")
# Aluminium_ts <- plot.ts(ALUMINIUM, main = "Aluminium Price")
# Copper_ts <- plot.ts(COPPER, main = "Copper Price")


## Simple Moving Averages (SMA)
# 20-day SMA
AL20 <- SMA(ALUMINIUM$`Closing Stock`, n=20)
AL20

CB20 <- SMA(COBALT$`Closing Stock`, n=20)
CB20

CP20 <-  SMA(COPPER$`Closing Stock`, n=20)
CP20

GL20 <-  SMA(GOLD$`USD (PM)`, n=20)
GL20

# Exponential Moving Average (EMA)
# 14-day EMA
AL_EMA14 <- EMA(ALUMINIUM$`Closing Stock`, n=14)
AL_EMA14

CB_EMA14 <- EMA(COBALT$`Closing Stock`, n=14)
CB_EMA14

CP_EMA14 <- EMA(COPPER$`Closing Stock`, n=14)
CP_EMA14

GL_EMA14 <- EMA(GOLD$`USD (PM)`, n=14)
GL_EMA14

# Bollinger Bands 
AL_BB20 <- BBands(ALUMINIUM$`Closing Stock`, sd=2.0, n=14, maType=EMA)
AL_BB20

CB_BB20 <- BBands(COBALT$`Closing Stock`, sd=2.0, n=14, maType=EMA)
CB_BB20

CP_BB20 <- BBands(COPPER$`Closing Stock`, sd=2.0, n=14, maType=EMA)
CP_BB20

GL_BB20 <- BBands(GOLD$`USD (PM)`, sd=2.0, n=14, maType=EMA)
GL_BB20

# Overall data frame
ALplusBB <- data.frame(ALUMINIUM,AL_BB20)
ALplusBB

CBplusBB <- data.frame(COBALT,CB_BB20)
CBplusBB

CPplusBB <- data.frame(COPPER,CP_BB20)
CPplusBB

GLplusBB <- data.frame(GOLD,GL_BB20)
GLplusBB

# Relative Strength Indicator
ALrsi14 <- RSI(ALplusBB$Closing.Stock, n=14)
ALrsi14

CBrsi14 <- RSI(CBplusBB$Closing.Stock, n=14)
CBrsi14

CPrsi14 <- RSI(CPplusBB$Closing.Stock, n=14)
CPrsi14

GLrsi14 <- RSI(GLplusBB$USD..PM., n=14)
GLrsi14

#MACD
ALmacd <- MACD(ALplusBB$Closing.Stock, nFast = 12, nSlow = 26,nSig = 9, maType = SMA)
ALmacd

CBmacd <- MACD(CBplusBB$Closing.Stock, nFast = 12 , nSlow = 26, nSig = 9, maType = SMA)
CBmacd

CPmacd <-  MACD(CPplusBB$Closing.Stock, nFast = 12 , nSlow = 26,nSig = 9, maType = SMA)
CPmacd

GLmacd <-  MACD(GLplusBB$USD..PM., nFast = 12 , nSlow = 26,nSig = 9, maType = SMA)
GLmacd

#Objective is to predict up or down on the daily price
#A clear binary classification problem
#Create the response variable
priceAL=ALUMINIUM$`Closing Stock`>=ALUMINIUM$`Opening Stock`
priceAL=c(NA,head(priceAL,-1))
classAL=ifelse(priceAL > 0,1,0)

priceCB=COBALT$`Closing Stock`>=COBALT$`Opening Stock`
priceCB=c(NA,head(priceCB,-1))
classCB=ifelse(priceCB > 0,1,0)

priceCP=COPPER$`Closing Stock`>=COPPER$`Opening Stock`
priceCP=c(NA,head(priceCP,-1))
classCP=ifelse(priceCP > 0,1,0)



# allData
allData <-  data.frame(classAL,ALUMINIUM,COBALT,COPPER,AL20,CB20,CP20,AL_EMA14,CB_EMA14,CP_EMA14,AL_BB20,CB_BB20,CP_BB20,ALrsi14,CBrsi14,CPrsi14,ALmacd,CBmacd,CPmacd)

allData <- allData[-c(1:25),]

model = data.matrix(allData)



#Data prep for training and test
train_sz=2/3
breakpt = nrow(model)*train_sz
traindata=model[1:breakpt,]
testdata=model[(breakpt+1):nrow(model),]
#Break train data into X and Y- Response Variable
X_train=traindata[,2:10]
Y_train=traindata[,1]
class(X_train)[1]
class(Y_train)
#Do the same for test data
X_test=testdata[,2:10]
Y_test=testdata[,1]
class(X_test)[1]
class(Y_test)
#Time to start XGBoost
set.seed(3213)
dtrain=xgb.DMatrix(data = X_train, label=Y_train)
xgmodel=xgboost(data=dtrain, nrounds = 20, nfold = 5, max_depth = 2, eta = 1, objective="binary:logistic")
#Use cross validation
dtrain=xgb.DMatrix(data = X_train, label=Y_train)
cv=xgb.cv(data = dtrain, nround=10, nfold = 5, objective="binary:logistic")
preds=predict(xgmodel,X_test)
prediction=as.numeric(preds>0.543)


# Determine the size of the prediction vector
print(length(preds))

# Limit display of predictions to the first 6
print(head(preds))

prediction = as.numeric(preds > 0.5)
print(head(prediction))



# Measuring model performance
error_value = mean(as.numeric(preds > 0.5) != Y_test)
print(paste("test-error=", error_value))


# View feature importance from the learnt model
importance_matrix = xgb.importance(model = xgmodel)
print(importance_matrix)

sum(importance_matrix$Frequence)
sum(importance_matrix$Cover)
sum(importance_matrix$Gain)


#Find AUC for this
library(pROC)
auc<-auc(Y_test,prediction)
print(paste('AUC Score:',auc))
rocg<-roc(Y_test,prediction)
plot(rocg, col="blue")
tablesamp <- table(prediction, Y_test)
tablesamp
library(class)

#Let's run another classification algorithm to test if our data is valid.
#This is a small script I wrote to automate and test for accuracy for up to
#k cases of KNN classification.
"Enter number of cases you wanna test for training data,
testdata, trainresponse and testresponse"
#Testing for accuracy which is TP + TN/ Total No. of Test Cases
getknnerr <-function(n, traindata, testdata, trainresp, testresp) {
  
  ncount=0
  err=0
  errcount=0
  tablen=0
  knnsamp <- knn(traindata, testdata, trainresp, k=1)
  tablesamp <- table(knnsamp, testresp)
  print(tablesamp)
  err=(tablesamp[1,1]+tablesamp[2,2])/(nrow(testdata))
  cat("Base error at k=1 :",err)
  for(i in 2:n){
    knnsamp2 <- knn(traindata, testdata, trainresp, k=i)
    tablesamp2 <- table(knnsamp2, testresp)
    errcheck=(tablesamp2[1,1]+tablesamp2[2,2])/(nrow(testdata))
    if(errcheck>err){
      ncount=i
      err=errcheck
      tablen=tablesamp2
    }
  }
  cat("\nfinal accuracy score:",err)
  cat("\nachieved at k=",ncount)
  tablen
  return(ncount)
}
#The function returns the k value with the highest accuracy.
knn<-getknnerr(10, traindata = X_train, testdata = X_test,trainresp = Y_train,testresp = Y_test)
knnreturn <- knn(X_train, X_test, Y_train, k=1)
tablesamp <- table(knnreturn, Y_test)
tablesamp
knnreturn <- sapply(knnreturn, as.numeric)
#Plot roc curve
rocg <- roc(Y_test,knnreturn)
plot(rocg)
aucsc <- auc(Y_test,knnreturn)
aucsc
#This library helps us visualise the xgboost trees
library(DiagrammeR)
xgb.plot.tree(model = xgmodel)
# View only the first tree in the XGBoost model
xgb.plot.tree(model = xgmodel)
xgb.plot.tree(model = xgmodel, trees = 1)


