plot1<- {
        
        data<-read.csv2("household_power_consumption.txt", header=TRUE, na.strings="?")
        data_day1<-data[which(data[,1]=="1/2/2007"),]
        data_day2<-data[which(data[,1]=="2/2/2007"),]
        data_subset<-rbind(data_day1, data_day2)
        coldata<-data_subset[,3]
        coldata2<-as.numeric(as.character(coldata)) 
        hist(coldata2, xlab="Global Active Power (kilowatts)", 
             main="Global Active Power", col="red")
        dev.copy(png, file="Plot1.png", width = 480, height = 480)
        dev.off()
        
}
        