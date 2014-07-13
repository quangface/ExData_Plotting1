## plot 3

## read in the data
hw1 <- read.table("household_power_consumption.txt", sep = ";", 
                  header = TRUE, stringsAsFactors = TRUE, 
                  na.strings = "?", nrows = 70000)

## subset the data on the two specified days
hw2a <- hw1[(hw1$Date == "1/2/2007" | hw1$Date == "2/2/2007"), ]

## plot the data
with(hw2b, plot(dateTime, hw2b$Sub_metering_1, type="l", ylab = "Energy sub meeting", xlab = "") )
lines(dateTime, hw2b$Sub_metering_2, type="l", col="red")
lines(dateTime, hw2b$Sub_metering_3, type="l", col="blue")
legend("topright", col = c("black", "red", "blue"), lty= "solid", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## save the png
dev.copy(png, file = "plot3.png")
dev.off()