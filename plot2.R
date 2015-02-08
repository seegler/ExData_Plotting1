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
png(filename = "plot2.png", width = 480, height = 480)

#plot line graph, x-label is empty
plot(data$DateTime, data$Global_active_power, type="l",
		xlab="", ylab="Global Active Power (kilowatts)")
dev.off()