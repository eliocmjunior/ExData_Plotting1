setwd("./exdata_data_household_power_consumption")
data <- read.delim('household_power_consumption.txt',sep = ";")
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
base <- subset(data,data$Date>='2007-02-01'&data$Date<='2007-02-02')

##First
png(file = "plot1.png",width=480, height=480)
firstplot <- as.numeric(base$Global_active_power)
hist(firstplot,col = 'red',xlab = "Global active power(kilowatts)",main = "Global active power" )
dev.off()
