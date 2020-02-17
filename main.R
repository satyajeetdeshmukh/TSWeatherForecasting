library(readr)
library(tidyr)


#import the full data
Sub_Division_IMD_2017 <- read_csv("Sub_Division_IMD_2017.csv")

# West madhyad pradesh begins at row 2085 till 2201
WMP <- Sub_Division_IMD_2017[2084:2200,3:14]

#Convert to matrix
WMP <- as.matrix(WMP)

#Convert data to a single vector
WMP <- t(WMP)
dim(WMP) <- c(117*12,1)

#convert vector data into time series format
RainfallTS <- ts(WMP, start=c(1901,1), end = c(2017,12), frequency = 12)
RainfallTS
plot(RainfallTS)

