#stat443 project_update

##import data
library(readr)
AAPL <- read_csv("~/Desktop/Courses/STAT443/STAT443_Project/data/AAPL.csv")
dat1 <- AAPL
is.ts(dat1)
dat2 <- as.ts(dat1)
dat2

##view data
View(dat2) # this dataset has 7 columns which are 7 variables

##plot data
plot(dat2) # we now have 7 plots

##pick one variable as our goal to do some analysis
##for example, lets try "Volumn"
Volume <- dat1$Volume
Volume

##plot Volume 
Volume <- as.ts(Volume)
plot(Volume)  

##examine acf and pacf 
acf(Volume, lag.max = 50) 
acf(Volume, lag.max = 100)
pacf(Volume,lag.max = 50)
pacf(Volume,lag.max = 100) 


##Box Test
Box.test(Volume, lag = 50, type = "Box-Pierce", fitdf = 0)

## First diff
diff <- diff(Volume, differences = 1)
plot(diff)
acf(diff)
pacf(diff)
Box.test(diff, lag = 50, type = "Box-Pierce")


arima(diff,order = c(2,0,0), include.mean = FALSE)


##split data into 2 parts, training and test sets to train our model
length(diff)
#if we use the last 12 data as our test set 
diff.train <- as.ts(diff[1:200])
diff.test <- as.ts(diff[241:252])
length(diff.test)
plot(diff.train)
acf(diff.train) 
pacf(diff.train) 

##use ar(2) to be our model
fit<-arima(diff.train, order = c(2,0,0))
fit
acf(fit$residuals)
tsdiag(fit)

predict(fit, n.ahead= 12)

##test error
foremodel<- predict(fit, n.ahead= 12)
foremodel
error <- sum((diff[241:252] - foremodel$pred)^2)
error


##use arma(2,3) to be our model
fit<-arima(diff.train, order = c(2,0,3))
fit
acf(fit$residuals)
tsdiag(fit)

predict(fit, n.ahead= 12)

##test error
foremodel<- predict(fit, n.ahead= 12)
foremodel
error <- sum((diff[241:252] - foremodel$pred)^2)
error

#prediction
length(Volume)
pred01<-Volume[253]+foremodel$pred[1]
pred01
pred02<-pred01+foremodel$pred[2]
pred02

