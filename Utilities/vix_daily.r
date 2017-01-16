rm(list = ls())

library(TTR)
library(forecast)
library(tseries)
###### set working directory
setwd("C:/learn/Git/R-work/Utilities")

##### source pkg function
source("pkg.r")
#pkg()
source("func.r")
index = getIndex()
toDate  <- format(Sys.time(), "%d-%b-%Y")

#########  reading dataset
train = read.csv(file.choose())
train = train[1:1708,]




####### Take  train data from Jan'2013 till dec'2015 && test data from Jan'16 till dec'16 #########
train$Date =  as.Date(train$Date, format = "%d-%b-%y")
#train$Date = as.Date(train$Date)

DATE1 <- as.Date("2010-01-01")
DATE2 <- as.Date("2014-12-31")
DATE3 <- as.Date("2016-12-31")



############ training and test data creation
training <- train[train$Date >= DATE1 & train$Date <= DATE2,2]
test <- train[train$Date > DATE2 & train$Date <= DATE3,2]
## adding new index in test
test <- c(test,index)
length(test)


######  Convert Data into Time Series #######

#####  frequency calculation = average of data present annualy from 2014 till 2016
##### start(year,day number) end(year,day number)
myts_training <- ts(training, start=c(2010,01), end=c(2014,244), frequency = 244) 
myts_test  <-  ts(test, start=c(2015,01), end=c(2016,244), frequency = 244)


######  Visualize the Time Series Created #######
plot(myts_training, col = "Blue",xlab="Year", ylab="Close",  main=" VIX_CLOSE VS YEAR")


####### Decompose the timeseries in seasonality and trend #########
decom = stl(myts_training, s.window="period")

####  plot of decomposed TimeSeries  #######
plot(decom)


####  stationarity test on series   ### series is stationary
adf.test(myts_training)
################ coverting to quartiles
 qrt = quantile(myts_training, 0.75)
myts_quantile = myts_training
for (i in 1:1220  )  {
if(myts_quantile[i] > 23.415)  
{
  myts_quantile[i] = qrt
}
  }

######### original vs new training

plot(myts_training, col = "blue", xlab = "Year", ylab ="close")
lines(myts_quantile, col= "Red")
legend("topleft", legend = c("transformed", "original"), col = c(2,4), lty = 7)



 ####   using holtwinters 
 hws_quantile <- HoltWinters(myts_quantile)
########## holtwinters forecast

holtwinter_quantile_forecast = forecast.HoltWinters(hws_quantile,h = 488, level = c(0.75,0.85,0.95))
plot.forecast(holtwinter_quantile_forecast, xlab = "Year", ylab = "close",sub="75%, 85%, 95% confidence bands")
lines(myts_test, col = "red")
legend("topleft", legend = c("original", "forecast"), col = c(2,4), lty = 7)

#, alpha = 0.875, gamma = 1)
######## predictions on quantile
predict_quantile = predict(hws_quantile, n.ahead = 495)
plot(myts_test,col = "red")
lines(predict_quantile,col = "blue")
write.csv(predict_quantile, file = "prediction_75% quartile.csv",row.names = FALSE)
############  plot of fitted

plot(myts_quantile,col = "blue")
lines(hws_quantile$fitted[,1], col = "red")


########### accuracy measure
predict_quantile
accuracy(myts_test,predict_quantile)



#### holt winters on training error
res = holtwinter_quantile_forecast$residuals
res_na = res[245:1220]

plot(res_na)
y= 4
lines(y, col = "red")

myhist <- hist(res_na)
multiplier <- myhist$counts / myhist$density
mydensity <- density(res_na)
mydensity$y <- mydensity$y * multiplier[1]

plot(myhist)
lines(mydensity)






plot.forecast(holtwinter_quantile_forecast)
res  = holtwinter_quantile_forecast$residuals
res_na = res[245:1220]
plot(res_na)
acf(res_na, lag.max = 244)
 

######### bollinger bands

bb20 = BBands(train$Close, sd=2.0)

dataPlusBB = data.frame(train,bb20)
complete = ts(train$Close, start = c(2010,01), end = c(2016,244), frequency = 244)

dataPlusBB$dn = ts(dataPlusBB$dn, start = c(2010,01), end = c(2016,244), frequency = 244)
dataPlusBB$up = ts(dataPlusBB$up, start = c(2010,01), end = c(2016,244), frequency = 244)
dataPlusBB$mavg = ts(dataPlusBB$mavg, start = c(2010,01), end = c(2016,244), frequency = 244)
plot(complete, col = "red")
lines(dataPlusBB$dn , col = "brown")
lines(dataPlusBB$up, col  = "yellow")
lines(dataPlusBB$mavg, col = "blue")


####### auto regression on r
res_na

 auto_regressive = ar(res_na)

 auto_regressive
 
 
 
 fitted(auto_regressive)
 
 
 plot(fitted(auto_regressive), col = "blue")
 
 
 lines(res_na, col = "red")
 
 
 
 
 
 
 ####### forecast on 488 residuals
 res_forecast = forecast(auto_regressive, 488 )
 focast = as.data.frame(res_forecast)

 plot.forecast(res_forecast)

 focast_res = ts(focast$`Point Forecast`, start = c(2015,01), end = c(2016,244), frequency = 244)
 
##### orginal residuals
 
original_res  = test - predict_quantile[1:488]
original_res =  ts(original_res, start = c(2015,01), end = c(2016,244), frequency = 244)
plot(original_res) 
lines(focast_res, col = "red")

write.csv(myts_quantile, file = "myts_values.csv", row.names = FALSE)
write.csv(hws_quantile$fitted[,1], file = "fitted_values.csv", row.names = FALSE)
predict_quantile

write.csv(predict_quantile, file = "predict_50% quartile.csv", row.names = FALSE)
