# This function contains common code for all plots
# The data file is read the Date column is converted to a Data object and
# a data frame is created with two days of data from the larger data set.
readConsumptionData <- function() {
    # Ensure data directory exists
    if(!file.exists("./data")){dir.create("./data")}
    
    # Download file if it doesn't exist
    if(!file.exists("./data/household_power_consumption.zip")) {
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileUrl,destfile="./data/household_power_consumption.zip")
    }
    
    if(!file.exists("./data/household_power_consumption.txt")) {
        library(utils)
    
        v <- unzip("./data/household_power_consumption.zip", exdir = "./data")
    }
    
    allData <- read.csv("./data/household_power_consumption.txt", sep = ";", colClasses = "character")
    allData$Date <- as.Date(allData$Date, "%d/%m/%Y")
    
    rangeData <- subset(allData, Date == "2007-02-01" | Date == "2007-02-02")
    
    is.na(rangeData$Global_active_power) <- which(rangeData$Global_active_power=="?")
    is.na(rangeData$Sub_metering_1) <- which(rangeData$Sub_metering_1=="?")
    is.na(rangeData$Sub_metering_2) <- which(rangeData$Sub_metering_2=="?")

    completeData <- rangeData[complete.cases(rangeData),]
  
    return (completeData)
}