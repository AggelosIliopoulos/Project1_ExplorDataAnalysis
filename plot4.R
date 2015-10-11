# Read Data in appropriate format

data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Obtain data from the dates 2007-02-01 and 2007-02-02.

SubData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Obtain Global Active Power

GAV <- as.numeric(SubData$Global_active_power)


# Obtain Sub_metering Data

Sub1 <- as.numeric(SubData$Sub_metering_1)

Sub2 <- as.numeric(SubData$Sub_metering_2)

Sub3 <- as.numeric(SubData$Sub_metering_3)

# obtain Voltage

Volt <- as.numeric(SubData$Voltage)

# obtain Global_reactive_power

GRP <- as.numeric(SubData$Global_reactive_power)

# Obtain TimeData

TimeData <- strptime(paste(SubData$Date, SubData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# 2x2 plot figures

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

# Plot GAV vs Time

plot(TimeData, GAV, type="l", ylab="Global Active Power", xlab="")

# Plot Volt vs Time

plot(TimeData, Volt, type="l", ylab="Voltage", xlab="datetime")

# Plot Sub_Meter vs Time

plot(TimeData, Sub1, type="l", ylab="Energy Submetering", xlab="")
lines(TimeData, Sub2, type="l", col="red")
lines(TimeData, Sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

# Plot GRP vs Time

plot(TimeData, GRP, type="l", ylab="Global_reactive_power", xlab="datetime")


# Saving to file .png
dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()
