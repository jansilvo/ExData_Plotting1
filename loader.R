if(!file.exists("household_power_consumption.txt")) {
    download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                  destfile="data.zip",
                  method="curl")
    unzip("exdata-data-household_power_consumption.zip")
}

dataTable <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
dataTable <- dataTable[(dataTable$Date == "1/2/2007") | (dataTable$Date == "2/2/2007"),]
dataTable$DateTime <- strptime(paste(dataTable$Date, dataTable$Time), "%d/%m/%Y %H:%M:%S")