# Plot 3

# Read data from file
mydata = read.csv("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")

# Keep only the data from the dates 2007-02-01 and 2007-02-02
mydataFiltered <- mydata[mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007",]
mydataFiltered$Time <- strptime(paste(mydataFiltered$Date, mydataFiltered$Time), "%d/%m/%Y %H:%M:%S")
mydataFiltered$Date <- as.Date(mydataFiltered$Date, "%d/%m/%Y")

# Generate plot, add lines and legend, and customize the x axis
plot(mydataFiltered$Time, mydataFiltered$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", xaxt="n")
lines(mydataFiltered$Time, mydataFiltered$Sub_metering_2, col="red")
lines(mydataFiltered$Time, mydataFiltered$Sub_metering_3, col="blue")
legend("topright", lwd=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
points <- c(as.numeric(mydataFiltered$Time)[1], as.numeric(mydataFiltered$Time)[1440], as.numeric(mydataFiltered$Time)[2880])
axis(1, at=points, labels=c("Thu","Fri","Sat"))

# Export to PNG
dev.copy(png,"plot3.png")
dev.off()
