#Plotting Assignment 1 for Exploratory Data Analysis - Plot 4

#Construct a 4x4 plot to show Global Active Power vs Dates, Voltage vs datetime, Energy sub metering vs Days and Gloabl_reactive_power vs datetime

setwd(".\\GitHub\\ExData_Plotting1\\")
powerData = read.table(".\\household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

str(powerData)
nrow(powerData) #Total rows in the dataset is 2075259

powerFebData = subset(powerData, Date %in% c("1/2/2007","2/2/2007"))

nrow(powerFebData) #Total rows filtered for two dates in Feb is 2880

eventTime = strptime(paste(powerFebData$Date, powerFebData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


#Set plot4.png 
png("plot4.png", width=480, height=480)

#Specify 4 quadrants
par(mfrow = c(2, 2)) 

#Plot Global Active Power vs Dates (1,1)
plot(eventTime, as.numeric(powerFebData$Global_active_power), type="l", xlab="", ylab="Global Active Power", cex=0.2)

#Plot Voltage vs datetime (1,2)
plot(eventTime, as.numeric(powerFebData$Voltage), type="l", xlab="datetime", ylab="Voltage")

#Plot Energy sub metering vs Days (2,1)
plot(eventTime, as.numeric(powerFebData$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="", col="black")
lines(eventTime, as.numeric(powerFebData$Sub_metering_2), type="l", col="red")
lines(eventTime, as.numeric(powerFebData$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#Plot Global reactive_power vs datetime (2,2)
plot(eventTime, as.numeric(powerFebData$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
