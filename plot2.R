# function plot1 creates a plot from speciied file. household_power_consumption.txt used by default 
plot2 <- function(path='household_power_consumption.txt') {
        #reading data and subsetting dates
        indata <- read.table(path, header = TRUE, sep = ";", na.strings = "?")
        indata2 <- indata[indata$Date == '1/2/2007' | indata$Date == '2/2/2007',]
        
        #converting to data format
        indata2$Time <- strptime(paste(indata2$Date, indata2$Time), format = '%d/%m/%Y %H:%M:%S')
        indata2$Date <- NULL
        
        #constructing the plot
        par(mfrow = c(1,1), mar = c(2,4,2,2))
        plot(indata2$Time, indata2$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = NULL)
        dev.copy(png, file = 'plot2.png') 
        dev.off() 
}