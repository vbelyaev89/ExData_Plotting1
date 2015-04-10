plot3 <- function(){
        #I'm not from the USA, so I need it for proper days' names Tue, Fri, Sat
        Sys.setlocale("LC_ALL","C")
        
        #I assume that we already in working directory with the file being extracted
        ds <- subset(read.table("household_power_consumption.txt", header = T, 
                                sep = ";", na.strings = "?", stringsAsFactors = F),
                     Date == '1/2/2007' | Date == '2/2/2007')
        ds$Date <- strptime(paste(ds$Date, ds$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
        
        #Start creating a file, I used "smooth" type for a png
        png(file = "plot3.png", width = 480, height = 480, type = "cairo-png")
        
        #Plotting graphs
        with(ds, plot(Date, Sub_metering_1,type = "l", xlab = "",
                      ylab = "Energy sub metering"))
        with(ds, points(Date, Sub_metering_2, type = "l", col = "Red"))
        with(ds, points(Date, Sub_metering_3, type = "l", col = "Blue"))
        legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), 
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        #The file has been created, turning off the device
        dev.off()        
}