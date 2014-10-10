data <- read.table("household_power_consumption.txt", sep = ";", header = T,na.strings = "?" )
##read the data from file

data2 <- subset(data, data[1] == "1/2/2007" | data[1] == "2/2/2007", select = c("Date","Time","Global_active_power")) 
##select the data from 2007-02-01 to 2007-02-02

data2 <- data2[complete.cases(data2),]
##clean the NAs within data

data2$Date <- as.Date(data2$Date, format = "%d/%m/%Y")
data2$Time = paste(data2$Date, data2$Time, sep=" ")
##combine the Date and the Time together

png("plot2.png")
##open the device and set the target file name to "plot2"

plot(strptime(data2$Time, "%Y-%m-%d %H:%M:%S"), as.numeric(data2$Global_active_power), ylab='Global Active Power (kilowatts)', xlab='',type='l')
##drae the diagram

dev.off()
##close the device