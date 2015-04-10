plot1 <- function(){
        #I assume that we already in working directory with the file being extracted
        ds <- subset(read.table("household_power_consumption.txt", header = T, 
                                sep = ";", na.strings = "?", stringsAsFactors = F),
                                Date == '1/2/2007' | Date == '2/2/2007')
        
        #Start creating a file, I used "smooth" type for a png
        png(file = "plot1.png", width = 480, height = 480, type = "cairo-png")
        
        #Plotting a graph
        hist(ds$Global_active_power, col = "Red", main = "Global Active Power", 
             xlab = "Global Active Power (kilowatts)")
        
        #The file has been created, turning off the device
        dev.off()                
}