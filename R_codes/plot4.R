data <- read.table("household_power_consumption.txt", sep = ";", header = T,na.strings = "?" )
##read data

data2 <- subset(data, data[1] == "1/2/2007" | data[1] == "2/2/2007") 
##select the data from 2007-02-01 to 2007-02-02

data2 <- data2[complete.cases(data2),]
##clean the NAs within data

data2$Date <- as.Date(data2$Date, format = "%d/%m/%Y")
data2$Time = paste(data2$Date, data2$Time, sep=" ")
##combine the Date and the Time together

png("plot4.png")
##open the device and set the target file name to "plot4"

par(mfrow=c(2,2))
##define a diagram with 2x2 sub-diagrams

plot(strptime(data2$Time, "%Y-%m-%d %H:%M:%S"), as.numeric(data2$Global_active_power), ylab='Global Active Power', xlab='', type='l')
##first diagram(upper left)
##the same as plot2.R

plot(strptime(data2$Time, "%Y-%m-%d %H:%M:%S"), as.numeric(data2$Voltage), xlab='datetime', ylab='Voltage', type='l')
##second diagram(upper right)

plot(strptime(data2$Time, "%Y-%m-%d %H:%M:%S"), as.numeric(data2$Sub_metering_1), ylab='Energy sub metering', xlab='',type='l')
lines(strptime(data2$Time, "%Y-%m-%d %H:%M:%S"), as.numeric(data2$Sub_metering_2), col='red')
lines(strptime(data2$Time, "%Y-%m-%d %H:%M:%S"), as.numeric(data2$Sub_metering_3), col='blue')
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty="solid")
##third diagram(lower left)
##the same as plot3.R

plot(strptime(data2$Time, "%Y-%m-%d %H:%M:%S"), as.numeric(data2$Global_reactive_power),xlab='datetime', ylab='Global_reactive_power', type='l')
##second diagram(lower right)

dev.off()
##close the device