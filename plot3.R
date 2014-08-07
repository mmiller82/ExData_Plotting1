# R file uses function in readData.R to get data
# Then it graphs plot3 of the project.
source("readData.R")

rangeData <- readConsumptionData()
rangeData$Sub_metering_1 <- as.numeric(rangeData$Sub_metering_1)
rangeData$Sub_metering_2 <- as.numeric(rangeData$Sub_metering_2)
rangeData$Sub_metering_3 <- as.numeric(rangeData$Sub_metering_3)

rangeData$DateTime <- as.POSIXct(paste(rangeData$Date,rangeData$Time))

mn <- min(rangeData$DateTime)
mx <- max(rangeData$DateTime)
with(rangeData,plot(rangeData$DateTime, rangeData$Sub_metering_1, type = "l", 
                    ylab = "Energy sub metering", xlab = "", xlim = c(mn,mx)))
with(rangeData, lines(rangeData$DateTime, rangeData$Sub_metering_2, col = "red"))
with(rangeData, lines(rangeData$DateTime, rangeData$Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

png(filename = "plot3.png")
dev.off()