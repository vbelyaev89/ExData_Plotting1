plot2 <- function(){
        #I'm not from the USA, so I need it for proper days' names Tue, Fri, Sat
        Sys.setlocale("LC_ALL","C")
        
        #I assume that we already in working directory with the file being extracted
        ds <- subset(read.table("household_power_consumption.txt", header = T, 
                                sep = ";", na.strings = "?", stringsAsFactors = F),
                     Date == '1/2/2007' | Date == '2/2/2007')
        ds$Date <- strptime(paste(ds$Date, ds$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
        
        #Start creating a file, I used "smooth" type for a png
        png(file = "plot2.png", width = 480, height = 480, type = "cairo-png")
        
        #Plotting a graph
        plot(ds$Date, ds$Global_active_power,type = "l", xlab = "", 
             ylab = "Global Active Power (kilowatts)")
        
        #The file has been created, turning off the device
        dev.off()
}