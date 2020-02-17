library(data.table)
library(ggplot2)
library(fpp2)
library(forecast)
library(stats)
library(tseries)
library(readr)

#import the full data
Sub_Division_IMD_2017 <- read.csv("Sub_Division_IMD_2017.csv")

# West madhyad pradesh begins at row 2085 till 2201
WMP <- Sub_Division_IMD_2017[2084:2200,3:14]

#Convert to matrix
WMP <- as.matrix(WMP)

#Convert data to a single col vector
WMP <- t(WMP)
dim(WMP) <- c(117*12,1)

if(sum(is.na(WMP)!=0)){
    print("Missing data points!")
} else print("Data imported ready for TS. No missing data points.")

#convert vector data into time series format 1901 - 2017
RainfallTS <- ts(WMP[1:1404,1], start=c(1901,1), frequency = 12)

#decompose into components
TSDecompose <- decompose(RainfallTS, type = "multiplicative", filter = NULL)
#plot(TSDecompose) #plots the components



