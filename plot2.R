data <- read.table("household_power_consumption.txt",sep=";",header=FALSE,skip=66637,nrows=2880)

names(data) <- c("Date","Time","Global_active_power","Global_reactive_power",
                 "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%H:%M:%S", tz="") 

head(data)
tail(data)


png(file = "plot2.png", width=480,height=480)
plot(data$Global_active_power, ylab="Global Active Power (kilowatts)", type="l",xaxt="n")
axis(side=1,at=c(0,1440,2881),labels=c("Thu","Fri","Sat"))
dev.off()


