setwd("E:/EDA")

library(readr)
dataset <- read_delim("household_power_consumption.txt", 
                      ";", escape_double = FALSE, trim_ws = TRUE)

dataset$Date=as.Date(dataset$Date, "%d/%m/%Y")
data1 <- dataset[ which(dataset$Date=="2007-02-01" | dataset$Date=="2007-02-02"), ]
data1$datetime <- as.POSIXct(paste(data1$Date,data1$Time),tz="UCT")


png('plot2.png', width = 480, height = 480)
plot(data1$datetime,data1$Global_active_power,type="l",xlab = "",ylab="Global Active Power(kilowatts)")
dev.off()