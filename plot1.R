# Plot 1

# Read data from file
mydata = read.csv("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")

# Keep only the data from the dates 2007-02-01 and 2007-02-02
mydataFiltered <- mydata[mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007",]
mydataFiltered$Date <- as.Date(mydataFiltered$Date, "%d/%m/%Y")

# Generate histogram
hist(mydataFiltered$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

# Export to PNG
dev.copy(png,"plot1.png")
dev.off()
