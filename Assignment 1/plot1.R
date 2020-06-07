setwd("E:/EDA")

library(readr)
dataset <- read_delim("household_power_consumption.txt", 
                      ";", escape_double = FALSE, trim_ws = TRUE)

dataset$Date=as.Date(dataset$Date, "%d/%m/%Y")
data1 <- dataset[ which(dataset$Date=="2007-02-01" | dataset$Date=="2007-02-02"), ]


png('plot1.png', width = 480, height = 480)
hist(data1$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power(kilowatts)")
dev.off()
