# Read Data in appropriate format

data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Obtain data from the dates 2007-02-01 and 2007-02-02.

SubData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Obtain Sub_metering Data

Sub1 <- as.numeric(SubData$Sub_metering_1)

Sub2 <- as.numeric(SubData$Sub_metering_2)

Sub3 <- as.numeric(SubData$Sub_metering_3)

# Obtain TimeData

TimeData <- strptime(paste(SubData$Date, SubData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Plot Sub_Meter vs Time

plot(TimeData, Sub1, type="l", ylab="Energy Submetering", xlab="")
lines(TimeData, Sub2, type="l", col="red")
lines(TimeData, Sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

# Saving to file .png
dev.copy(png, file="plot3.png", height=480, width=480)

dev.off()
