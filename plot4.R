setwd("./exdata_data_household_power_consumption")
data <- read.delim('household_power_consumption.txt',sep = ";")
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
base <- subset(data,data$Date>='2007-02-01'&data$Date<='2007-02-02')
##Last
png(file = "plot4.png",width=480, height=480)

lastplot <- cbind.data.frame(paste(base$Date,base$Time), base$Voltage, base$Global_active_power,base$Global_reactive_power, base$Sub_metering_1, base$Sub_metering_2, base$Sub_metering_3)
colnames(lastplot) <- c("fdate","Voltage","Globalactivepower","Globalreactivepower","Sub_metering_1","Sub_metering_2","Sub_metering_3")
lastplot$fdate <- as.POSIXct(lastplot$fdate)

par(mfrow=c(2,2))
with(lastplot, {
     plot(Globalactivepower~fdate, type="l", 
          ylab="Global Active Power (kW)", xlab="")
     plot(Voltage~fdate, type="l", 
          ylab="Voltage", xlab="")
     plot(Sub_metering_1~fdate, type="l", 
          ylab="Global Active Power (kW)", xlab="")
     lines(Sub_metering_2~fdate,col='Red')
     lines(Sub_metering_3~fdate,col='Blue')
     legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
            legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
     plot(Globalreactivepower~fdate, type="l", 
          ylab="Global Rective Power (kW)",xlab="")})
dev.off()
