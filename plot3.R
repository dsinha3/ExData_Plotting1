##read data
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric","numeric"))

##convert char to Date
data$Date<-as.Date(data$Date,format="%d/%m/%Y")

##convert time to combined Date Time
data$Time<-strptime(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")

##subsetting the data for dates "01/02/2007" and"02/02/2007"
filtering<-(data$Date>=as.Date("01/02/2007",format="%d/%m/%Y")& data$Date<=as.Date("02/02/2007",format="%d/%m/%Y"))
filteredData<-data[filtering,]

##starting png driver
png("plot3.png", width=480, height=480, units="px")

##generate time series
plot(filteredData$Time,filteredData[,7],type = "n",ylab="Energy sub meeting",xlab=" ")

##plot lines for sub meterings
lines(filteredData$Time,filteredData[,7])
lines(filteredData$Time,filteredData[,8],col="red")
lines(filteredData$Time,filteredData[,9],col="blue")

##plotting legend
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))

##turning off driver
dev.off()

