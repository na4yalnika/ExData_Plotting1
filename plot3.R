# function plot1 creates a plot from speciied file. household_power_consumption.txt used by default 
plot3 <- function(path='household_power_consumption.txt') {
        #reading data and subsetting dates
        indata <- read.table(path, header = TRUE, sep = ";", na.strings = "?")
        indata2 <- indata[indata$Date == '1/2/2007' | indata$Date == '2/2/2007',]
        
        #converting to data format
        indata2$Time <- strptime(paste(indata2$Date, indata2$Time), format = '%d/%m/%Y %H:%M:%S')
        indata2$Date <- NULL
        
        #constructing the plot
        png('plot3.png', width = 480, height = 480)
        par(mfrow = c(1,1), mar = c(2,4,1,1))
        plot(indata2$Time, indata2$Sub_metering_1, ylab = 'Energy sub metering', type = "n")
        lines(indata2$Time, indata2$Sub_metering_1, type = 'l')
        lines(indata2$Time, indata2$Sub_metering_2, type = 'l', col = 'red')
        lines(indata2$Time, indata2$Sub_metering_3, type = 'l', col = 'blue')
        legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), lty = c(1,1,1))
        
        #dev.copy(png, file = 'plot3.png') 
        dev.off() 
}