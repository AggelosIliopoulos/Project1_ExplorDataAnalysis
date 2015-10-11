# Read Data in appropriate format

data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Obtain data from the dates 2007-02-01 and 2007-02-02.

SubData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Obtain Global Active Power

GAV <- as.numeric(SubData$Global_active_power)

# Obtain TimeData

TimeData <- strptime(paste(SubData$Date, SubData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Plot GAV vs Time

plot(TimeData, GAV, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# Saving to file .png
dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()
