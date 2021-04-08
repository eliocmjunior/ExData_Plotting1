setwd("./exdata_data_household_power_consumption")
data <- read.delim('household_power_consumption.txt',sep = ";")
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
base <- subset(data,data$Date>='2007-02-01'&data$Date<='2007-02-02')
##Second
png(file = "plot2.png",width=480, height=480)

secplot <- cbind.data.frame(paste(base$Date,base$Time),base$Global_active_power)
colnames(secplot) <- c("fdate","globalactivepower")
secplot$fdate <- as.POSIXct(secplot$fdate)
plot(secplot$fdate,secplot$globalactivepower, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
