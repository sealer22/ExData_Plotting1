data <- read.table("household_power_consumption.txt", sep = ";", header = T,na.strings = "?" )
##read source data

data2 <- subset(data, data[1] == "1/2/2007" | data[1] == "2/2/2007", select = c("Global_active_power")) 
##select data from 2007-02-01 to 2007-02-02
##select the Global active power column only

data3 <- data2[complete.cases(data2),]
##eliminate empty values

png("plot1.png")
##open the device and set the target file name to "plot1"

hist(as.numeric(data3), main = "Global active power", xlab = "Global_active_power(kilowatt)", , col="red")
##draw the diagram

dev.off()
##close the device