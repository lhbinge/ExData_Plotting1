
data <- read.table("household_power_consumption.txt",sep=";",header=FALSE,skip=66637,nrows=2880)

names(data) <- c("Date","Time","Global_active_power","Global_reactive_power",
                 "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%H:%M:%S", tz="") 

head(data)
tail(data)

png(file = "plot1.png", width=480,height=480)
hist(data$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()   ## Don't forget to close the PNG device!


