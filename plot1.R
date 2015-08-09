# function plot1 creates a plot from speciied file. household_power_consumption.txt used by default 
plot1 <- function(path='household_power_consumption.txt') {
        #reading data and subsetting dates
        indata <- read.table(path, header = TRUE, sep = ";", na.strings = "?")
        indata2 <- indata[indata$Date == '1/2/2007' | indata$Date == '2/2/2007',]
       
        #converting to data format
        indata2$Time <- strptime(paste(indata2$Date, indata2$Time), format = '%d/%m/%Y %H:%M:%S')
        indata2$Date <- NULL
        
        #constructing the plot
        par(mfrow = c(1,1), mar = c(4,4,2,2))
        par(mar = c(4,4,2,2))
        hist(indata2$Global_active_power, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency')
        dev.copy(png, file = 'plot1.png') 
        dev.off() 
}