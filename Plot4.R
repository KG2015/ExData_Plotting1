plot4<-{data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
        data_subset<-data[data$Date %in% c("1/2/2007", "2/2/2007"),]
        
        comb_time<-strptime(paste(data_subset$Date, data_subset$Time, sep=""), "%d/%m/%Y %H:%M:%S")
        
        power_correct<-as.numeric(data_subset$Global_active_power)
        
        voltage<-as.numeric(data_subset$Voltage)
        
        submetering1<-as.numeric(data_subset$Sub_metering_1)
        submetering2<-as.numeric(data_subset$Sub_metering_2)
        submetering3<-as.numeric(data_subset$Sub_metering_3)
        
        reactive<-as.numeric(data_subset$Global_reactive_power)
        
        par(mfrow=c(2,2))
        
        plot(comb_time, power_correct, type ="l", xlab="", ylab="Global Active Power (kilowatts)")
        
        plot(comb_time, voltage, type="l", xlab="datetime", ylab = "Voltage")
        
        plot(comb_time, submetering1, type = "l", xlab="", ylab="Energy sub metering", col="black")
        lines(comb_time, submetering2, type = "l", xlab="", ylab="Energy sub metering", col="red")
        lines(comb_time, submetering3, type = "l", xlab="", ylab="Energy sub metering", col="blue")
        legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
               col=c("black", "red","blue"), lwd=2)
        
        plot(comb_time, reactive, type="l", xlab="datetime", ylab = "Global_reactive_power")
        
        dev.copy(png, file="Plot4.png", width = 480, height = 480)
        dev.off() 
}