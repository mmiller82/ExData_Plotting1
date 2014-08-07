# R file uses function in readData.R to get data
# Then it graphs plot4 of the project.
source("readData.R")

rangeData <- readConsumptionData()
rangeData$Global_active_power <- as.numeric(rangeData$Global_active_power)
rangeData$Global_reactive_power <- as.numeric(rangeData$Global_reactive_power)
rangeData$Voltage <- as.numeric(rangeData$Voltage)
rangeData$Sub_metering_1 <- as.numeric(rangeData$Sub_metering_1)
rangeData$Sub_metering_2 <- as.numeric(rangeData$Sub_metering_2)
rangeData$Sub_metering_3 <- as.numeric(rangeData$Sub_metering_3)

rangeData$DateTime <- as.POSIXct(paste(rangeData$Date,rangeData$Time))

mn <- min(rangeData$DateTime)
mx <- max(rangeData$DateTime)

par(mfrow = c(2,2))
plot(rangeData$DateTime, rangeData$Global_active_power, type = "l", ylab = "Global Active Power", 
     xlab = "", xlim = c(mn,mx))

plot(rangeData$DateTime, rangeData$Voltage, type = "l", ylab = "Voltage", 
     xlab = "datetime", xlim = c(mn,mx))

with(rangeData, {
    with(rangeData,plot(rangeData$DateTime, rangeData$Sub_metering_1, type = "l", 
                        ylab = "Energy sub metering", xlab = "", xlim = c(mn,mx)))
    with(rangeData, lines(rangeData$DateTime, rangeData$Sub_metering_2, col = "red"))
    with(rangeData, lines(rangeData$DateTime, rangeData$Sub_metering_3, col = "blue"))
    legend("topright", lty = 1, col = c("black","red","blue"), 
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n")
})

plot(rangeData$DateTime, rangeData$Global_reactive_power, type = "l", ylab = "Global_reactive_power", 
     xlab = "datetime", ylim = c(0,0.5), xlim = c(mn,mx))
axis(2, at = c(0.1,0.2,0.3,0.4,0.5))


png(filename = "plot4.png")
dev.off()