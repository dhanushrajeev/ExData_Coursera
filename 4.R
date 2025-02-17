# setting current working directory
setwd("C:/Users/Admin/Downloads/exdata_data_household_power_consumption")

# Accessing the data from household_power_consumption.txt file
hhpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
#Use data from the dates 2007-02-01 and 2007-02-02
onemonthData <- hhpc[hhpc$Date %in% c("1/2/2007","2/2/2007") ,]


# Global Activie Power - Histogram Chart 

dt <- strptime(paste(onemonthData$Date, onemonthData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gAP <- as.numeric(onemonthData$Global_active_power)
gRP <- as.numeric(onemonthData$Global_reactive_power)
volt <- as.numeric(onemonthData$Voltage)

sm1 <- as.numeric(onemonthData$Sub_metering_1)
sm2 <- as.numeric(onemonthData$Sub_metering_2)
sm3 <- as.numeric(onemonthData$Sub_metering_3)
# Exporting chart in png format
png("plot4.png", width=480, height=480)
### create multiple charts 
par(mfrow = c(2, 2)) 

plot(dt, gAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(dt, volt, type="l", xlab="datetime", ylab="Voltage")

plot(dt, sm1, type="l", ylab="Energy Submetering", xlab="")
lines(dt, sm2, type="l", col="red")
lines(dt, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(dt, gRP, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()