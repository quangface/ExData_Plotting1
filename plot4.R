## plot 4
## read in the data
hw1 <- read.table("household_power_consumption.txt", sep = ";", 
                  header = TRUE, stringsAsFactors = TRUE, 
                  na.strings = "?", nrows = 70000)

## subset the data on the two specified days
hw2a <- hw1[(hw1$Date == "1/2/2007" | hw1$Date == "2/2/2007"), ]

dateTime <- strptime( paste(hw2a$Date,hw2a$Time), format="%d/%m/%Y %H:%M:%S")
hw2b <- c(hw2a, dateTime)

## set the layout
par(mfrow = c(2,2), mar = c(5,4,2,1), bg = "white")

## create the 4 plots
with(hw2b, plot(dateTime, Global_active_power, type="l", 
                ylab = "Global Active Power", xlab = ""))
with(hw2b, plot(dateTime, Voltage, type="l", 
                ylab = "Voltage"))
with(hw2b, plot(dateTime, hw2b$Sub_metering_1, type="l", 
                ylab = "Energy sub meeting", xlab = "") )
lines(dateTime, hw2b$Sub_metering_2, type="l", col="red")
lines(dateTime, hw2b$Sub_metering_3, type="l", col="blue")
legend("topright", col = c("black", "red", "blue"), lty= "solid", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       bty = "n")
with(hw2b, plot(dateTime, Global_reactive_power, type="l"))

## save the png
dev.copy(png, file = "plot4.png")
dev.off()