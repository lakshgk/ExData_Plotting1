#Plotting Assignment 1 for Exploratory Data Analysis - Plot 3

#Construct a plot to show Energy sub metering vs Days

setwd(".\\GitHub\\ExData_Plotting1\\")
powerData = read.table(".\\household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

str(powerData)
nrow(powerData) #Total rows in the dataset is 2075259

powerFebData = subset(powerData, Date %in% c("1/2/2007","2/2/2007"))

nrow(powerFebData) #Total rows filtered for two dates in Feb is 2880

eventTime = strptime(paste(powerFebData$Date, powerFebData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Set plot3.png 
png("plot3.png", width=480, height=480)

plot(eventTime, as.numeric(powerFebData$Sub_metering_1), type="l", ylab="Energy Sub metering", xlab="", col="black")
lines(eventTime, as.numeric(powerFebData$Sub_metering_2), type="l", col="red")
lines(eventTime, as.numeric(powerFebData$Sub_metering_3), type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()
