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
png("plot4.png", width=480, height=480, units="px",res=200)

##set count of graphs per row
par(mfrow=c(2,2))

##plot Global Active Power VS Time graph
plot(filteredData$Time,filteredData[,3],type="l",xlab=" ",ylab="Global Active Power")

##Plot Voltage VS Time graph
plot(filteredData$Time,filteredData[,5],type="l",xlab="datetime",ylab="Voltage")


##plot the Energy sub metering vs Time graph
plot(filteredData$Time,filteredData[,7],type = "n",ylab="Energy sub meeting",xlab=" ")
lines(filteredData$Time,filteredData[,7])
lines(filteredData$Time,filteredData[,8],col="red")
lines(filteredData$Time,filteredData[,9],col="blue")
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),bty="n")

##plot Global_reactive_power vs Time graph
plot(filteredData$Time,filteredData[,4],type="l",xlab="datetime",ylab="Global_reactive_power")

##turning off driver
dev.off()
