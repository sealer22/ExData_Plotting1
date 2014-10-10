data <- read.table("household_power_consumption.txt", sep = ";", header = T,na.strings = "?" )
##read data

data2 <- subset(data, data[1] == "1/2/2007" | data[1] == "2/2/2007", select = c("Date","Time","Sub_metering_1","Sub_metering_2","Sub_metering_3")) 
##select the data from 2007-02-01 to 2007-02-02

data2 <- data2[complete.cases(data2),]
##clean the NAs within data

data2$Date <- as.Date(data2$Date, format = "%d/%m/%Y")
data2$Time = paste(data2$Date, data2$Time, sep=" ")
##combine the Date and the Time together

png("plot3.png")
##open the device and set the target file name to "plot3"

plot(strptime(data2$Time, "%Y-%m-%d %H:%M:%S"), as.numeric(data2$Sub_metering_1), ylab='Energy sub metering', xlab='',type='l')
##draw the diagram for sub_metering_1

lines(strptime(data2$Time, "%Y-%m-%d %H:%M:%S"), as.numeric(data2$Sub_metering_2), col='red')
##add the line for sub_metering_2
##set the line color to red

lines(strptime(data2$Time, "%Y-%m-%d %H:%M:%S"), as.numeric(data2$Sub_metering_3), col='blue')
##add the line for sub_metering_3
##set the line color to blue

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty="solid")
##display the line information on the topright of the diagram

dev.off()
##close the device