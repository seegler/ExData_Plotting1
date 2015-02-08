##Exploratory Data Analysis - Project1
#Plot histogram of Global_active_power variable and save in png

library("data.table")

#Assume data file is in current directory
#Read data file
data <- fread("household_power_consumption.txt")

#convert Data column to Date type
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#pick data for 2007-02-01 to 02
data <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02"]

#convert data to data.frame
data <- data.frame(data)

#concatenate Date and Time variables and assign to new DateTime variable
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "),
                          format="%Y-%m-%d %H:%M:%S")
                          

#Initialize graphics device
png(filename = "plot4.png", width = 480, height = 480)

#plot graph
#Set 2x2 table layout on canvas
par(mfrow=c(2, 2))

plot(data$DateTime, data$Global_active_power, type="l",
		xlab="", ylab="Global Active Power")
plot(data$DateTime, data$Voltage, type="l",
		xlab="datetime", ylab="Voltage")
plot(data$DateTime, data$Sub_metering_1, type="l",
		xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", bty="n", lty=1, col=c("black", "red", "blue"),
		legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(data$DateTime, data$Global_reactive_power, type="l",
		xlab="datetime", ylab="Global_reactive_Power")

dev.off()