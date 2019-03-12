#Plotting Assignment 1 for Exploratory Data Analysis - Plot 2

#Construct a plot to show Global Active Power (Kilowatts) vs Days

setwd(".\\GitHub\\ExData_Plotting1\\")
powerData = read.table(".\\household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

str(powerData)
nrow(powerData) #Total rows in the dataset is 2075259

powerFebData = subset(powerData, Date %in% c("1/2/2007","2/2/2007"))

nrow(powerFebData) #Total rows filtered for two dates in Feb is 2880

#Set plot1.png 
png("plot2.png", width = 480, height = 480)

#Concatenate Date and Time 
eventTime = strptime(paste(powerFebData$Date, powerFebData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

plot(eventTime, as.numeric(powerFebData$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
