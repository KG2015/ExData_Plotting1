plot2<- {
       
        data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
        data_subset<-data[data$Date %in% c("1/2/2007", "2/2/2007"),]
        
        power_correct<-as.numeric(data_subset$Global_active_power)
        
        
        comb_time<-strptime(paste(data_subset$Date, data_subset$Time, sep=""), "%d/%m/%Y %H:%M:%S")
        

        plot(comb_time, power_correct, type ="l", xlab="", ylab="Global Active Power (kilowatts)")
        
        dev.copy(png, file="Plot2.png", width = 480, height = 480)
        dev.off()       
                
}