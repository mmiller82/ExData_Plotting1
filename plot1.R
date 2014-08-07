# R file uses function in readData.R to get data
# Then it graphs plot1 of the project.
source("readData.R")

rangeData <- readConsumptionData()
rangeData$Global_active_power <- as.numeric(rangeData$Global_active_power)

hist(rangeData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", xlim=c(0,6))

png(filename = "plot1.png")
dev.off()