# Plot 2

# Read data from file
mydata = read.csv("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")

# Keep only the data from the dates 2007-02-01 and 2007-02-02
mydataFiltered <- mydata[mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007",]
mydataFiltered$Time <- strptime(paste(mydataFiltered$Date, mydataFiltered$Time), "%d/%m/%Y %H:%M:%S")
mydataFiltered$Date <- as.Date(mydataFiltered$Date, "%d/%m/%Y")

# Generate plot and customize the x axis
plot(mydataFiltered$Time, mydataFiltered$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="", xaxt="n")
points <- c(as.numeric(mydataFiltered$Time)[1], as.numeric(mydataFiltered$Time)[1440], as.numeric(mydataFiltered$Time)[2880])
axis(1, at=points, labels=c("Thu","Fri","Sat"))

# Export to PNG
dev.copy(png,"plot2.png")
dev.off()
