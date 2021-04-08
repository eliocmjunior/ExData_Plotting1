setwd("./exdata_data_household_power_consumption")
data <- read.delim('household_power_consumption.txt',sep = ";")
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
base <- subset(data,data$Date>='2007-02-01'&data$Date<='2007-02-02')
##Third
png(file = "plot3.png",width=480, height=480)

thirdplot <- cbind.data.frame(paste(base$Date,base$Time),base$Sub_metering_1, base$Sub_metering_2,base$Sub_metering_3)
colnames(thirdplot) <- c("fdate","Sub_metering_1","Sub_metering_2","Sub_metering_3")
thirdplot$fdate <- as.POSIXct(thirdplot$fdate)
plot(thirdplot$fdate, thirdplot$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(thirdplot$fdate, thirdplot$Sub_metering_2,col="red")
lines(thirdplot$fdate, thirdplot$Sub_metering_3,col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1","Sub_metering_2", "Sub_metering_3")
       ,lty=c(1,1), lwd=c(1,1))
dev.off()
