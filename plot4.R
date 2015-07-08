data <- read.table("household_power_consumption.txt",sep=";",header=FALSE,skip=66637,nrows=2880)

names(data) <- c("Date","Time","Global_active_power","Global_reactive_power",
                 "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%H:%M:%S", tz="") 

head(data)
tail(data)

png(file = "plot4.png", width=480,height=480)
par(mfrow = c(2, 2))

plot(data$Global_active_power, ylab="Global Active Power (kilowatts)", type="l",xaxt="n")
axis(side=1,at=c(0,1440,2881),labels=c("Thu","Fri","Sat"))

plot(data$Voltage, xlab="datetime", ylab="Voltage", type="l",xaxt="n")
axis(side=1,at=c(0,1440,2881),labels=c("Thu","Fri","Sat"))

with(data,plot(data$Sub_metering_1, ylab="Energy sub metering", xlab="", type="n",xaxt="n"))
lines(data$Sub_metering_1, col = "black") 
lines(data$Sub_metering_2, col = "red") 
lines(data$Sub_metering_3, col = "blue") 
legend("topright", bty="n", lty=1, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(side=1,at=c(0,1440,2881),labels=c("Thu","Fri","Sat"))

plot(data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l",xaxt="n")
axis(side=1,at=c(0,1440,2881),labels=c("Thu","Fri","Sat"))
dev.off()
