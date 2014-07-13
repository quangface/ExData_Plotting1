## plot 2
## read in the data
hw1 <- read.table("household_power_consumption.txt", sep = ";", 
                  header = TRUE, stringsAsFactors = TRUE, 
                  na.strings = "?", nrows = 70000)

## subset the data on the two specified days
hw2a <- hw1[(hw1$Date == "1/2/2007" | hw1$Date == "2/2/2007"), ]

## reset the canvas
par(mfrow = c(1,1), bg = "white")

## create the time
dateTime <- strptime( paste(hw2a$Date,hw2a$Time), format="%d/%m/%Y %H:%M:%S")
hw2b <- c(hw2a, dateTime)
with(hw2b, plot(dateTime, Global_active_power, type="l", 
                ylab = "Global Active Power (kilowatts)", xlab = ""))

## save the png
dev.copy(png, file = "plot2.png")
dev.off()