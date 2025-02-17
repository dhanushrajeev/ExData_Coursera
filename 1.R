# Set the correct working directory (folder containing extracted file)
setwd("C:/Users/Admin/Downloads/exdata_data_household_power_consumption")

# Load data properly, replacing "?" with NA
hhpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                   stringsAsFactors = FALSE, na.strings = "?")

# Convert Date column to Date format
hhpc$Date <- as.Date(hhpc$Date, format="%d/%m/%Y")

# Filter data for February 1 and 2, 2007
onemonthData <- subset(hhpc, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Convert Global Active Power to numeric
gAP <- as.numeric(onemonthData$Global_active_power)

# Export histogram plot
png("plot1.png", width=480, height=480)
hist(gAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

