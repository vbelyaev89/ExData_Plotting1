plot4 <- function(){
        #I'm not from the USA, so I need it for proper days' names Tue, Fri, Sat
        Sys.setlocale("LC_ALL","C")
        
        #I assume that we already in working directory with the file being extracted
        ds <- subset(read.table("household_power_consumption.txt", header = T, 
                                sep = ";", na.strings = "?", stringsAsFactors = F),
                     Date == '1/2/2007' | Date == '2/2/2007')        
        ds$Date <- strptime(paste(ds$Date, ds$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
        
        #Start creating a file, I used "smooth" type for a png
        png(file = "plot4.png", width = 480, height = 480, type = "cairo-png")
        
        #Setting main parameters
        par(mfrow = c(2, 2))
        
        #The first plot
        with(ds, plot(Date, Global_active_power,type = "l", xlab = "", 
                      ylab = "Global Active Power"))
        
        #The second plot
        with(ds, plot(Date, Voltage,type = "l", xlab = "datetime", ylab = "Voltage"))
        
        #The third plot - !important: I changed the scale by cex = 0.9
        with(ds, plot(Date, Sub_metering_1,type = "l", xlab = "",
                      ylab = "Energy sub metering"))
        with(ds, points(Date, Sub_metering_2, type = "l", col = "Red"))
        with(ds, points(Date, Sub_metering_3, type = "l", col = "Blue"))
        legend("topright", bty = "n", lty = c(1, 1, 1), col = c("black", "red", "blue"), 
            cex = 0.9, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        #The forth plot
        with(ds, plot(Date, Global_reactive_power,type = "l", xlab = "datetime"))
        
        #The file has been created, turning off the device
        dev.off()
}