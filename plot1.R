# Read Data in appropriate format

data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Read the Named of Columns

names(data)

# Obtain data from the dates 2007-02-01 and 2007-02-02.

SubData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Obtain Global Active Power

GAV <- as.numeric(SubData$Global_active_power)

# histogram of GAV with appropriate settings

hist(GAV, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Saving to file .png
dev.copy(png, file="plot1.png", height=480, width=480)

dev.off()
