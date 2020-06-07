setwd("E:/EDA")

library(readr)
dataset <- read_delim("household_power_consumption.txt", 
                      ";", escape_double = FALSE, trim_ws = TRUE)

dataset$Date=as.Date(dataset$Date, "%d/%m/%Y")
data1 <- dataset[ which(dataset$Date=="2007-02-01" | dataset$Date=="2007-02-02"), ]
data1$datetime <- as.POSIXct(paste(data1$Date,data1$Time),tz="UCT")


png('plot4.png', width = 480, height = 480)
par(mfrow=c(2,2))

#1
plot(data1$datetime,data1$Global_active_power,type="l",xlab = "",ylab="Global Active Power(kilowatts)")


#2
plot(data1$datetime,data1$Voltage,type="l",xlab = "datetime",ylab="Voltage")

#3
plot(data1$datetime, data1$Sub_metering_1, type ="n", xlab = "", ylab = "Energy sub metering")
lines(data1$datetime, data1$Sub_metering_1,col="black")
lines(data1$datetime, data1$Sub_metering_2,col = "red")
lines(data1$datetime, data1$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1)

#4
plot(data1$datetime,data1$Global_reactive_power,type="l",xlab = "datetime",ylab = "Global_reactive_power")

dev.off()