##Plot Global_active_power VS Time graph

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
png("plot1.png", width=480, height=480, units="px")

##plotting histogram with red color
hist(filteredData$Global_active_power,col=c("red"),xlab="Global Active Power (Killowatts)",ylab="frequency", main="Global Active Power")

##turning the driver off
dev.off()

