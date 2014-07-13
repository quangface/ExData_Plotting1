## plot 1
## read in the data
hw1 <- read.table("household_power_consumption.txt", sep = ";", 
                  header = TRUE, stringsAsFactors = TRUE, 
                  na.strings = "?", nrows = 70000)

## subset the data on the two specified days
hw2a <- hw1[(hw1$Date == "1/2/2007" | hw1$Date == "2/2/2007"), ]

## create the histogram 

par(mfrow = c(1,1))


hist(hw2a$Global_active_power, col = "red", breaks = 12, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

## save the png
dev.copy(png, file = "plot1.png")
dev.off()