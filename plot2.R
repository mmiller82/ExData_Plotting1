# R file uses function in readData.R to get data
# Then it graphs plot2 of the project.
source("readData.R")

rangeData <- readConsumptionData()
rangeData$Global_active_power <- as.numeric(rangeData$Global_active_power)

rangeData$DateTime <- as.POSIXct(paste(rangeData$Date,rangeData$Time))

plot(rangeData$DateTime, rangeData$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", 
     xlab = "", xlim = c(min(rangeData$DateTime),max(rangeData$DateTime)))

png(filename = "plot2.png")
dev.off()