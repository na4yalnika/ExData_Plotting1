# function plot1 creates a plot from speciied file. household_power_consumption.txt used by default 
plot4 <- function(path='household_power_consumption.txt') {
        #reading data and subsetting dates
        indata <- read.table(path, header = TRUE, sep = ";", na.strings = "?")
        indata2 <- indata[indata$Date == '1/2/2007' | indata$Date == '2/2/2007',]
        
        #converting to data format
        indata2$Time <- strptime(paste(indata2$Date, indata2$Time), format = '%d/%m/%Y %H:%M:%S')
        indata2$Date <- NULL
        
        #constracting plots
        png('plot4.png', width = 640, height = 480)
        par(mfrow = c(2,2))
        
        #plot1
        par(mar = c(2,4,2,2))
        plot(indata2$Time, indata2$Global_active_power, type = "l", ylab = "Global Active Power", xlab = NULL)
        
        #plot2
        par(mar = c(4,4,2,2))
        plot(indata2$Time, indata2$Voltage, type = "l", ylab = 'Voltage', xlab = 'datetime')
        
        
        #plot3
        par(mar = c(2,4,2,2))
        plot(indata2$Time, indata2$Sub_metering_1, ylab = 'Energy sub metering', type = "n")
        lines(indata2$Time, indata2$Sub_metering_1, type = 'l')
        lines(indata2$Time, indata2$Sub_metering_2, type = 'l', col = 'red')
        lines(indata2$Time, indata2$Sub_metering_3, type = 'l', col = 'blue')
        legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), lty = c(1,1,1), bty = 'n')
        
        #plot4
        par(mar = c(4,4,2,2))
        plot(indata2$Time, indata2$Global_reactive_power, type = "l", ylab = 'Global_reactive_power', xlab = 'datetime')
        #dev.copy(png, file = 'plot4.png') 
        dev.off() 
}