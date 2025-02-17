# setting current working directory
setwd("C:/Users/Admin/Downloads/exdata_data_household_power_consumption")
# Accessing the data from household_power_consumption.txt file
hhpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
#Use data from the dates 2007-02-01 and 2007-02-02
onemonthData <- hhpc[hhpc$Date %in% c("1/2/2007","2/2/2007") ,]


# Global Activie Power - Histogram Chart 

dt <- strptime(paste(onemonthData$Date, onemonthData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gAP <- as.numeric(onemonthData$Global_active_power)

# Exporting chart in png format
png("plot2.png", width=480, height=480)

plot(dt, gAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()

