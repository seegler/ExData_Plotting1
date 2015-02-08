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

#convert Global_active_power to numeric
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

#Initialize graphics device
png(filename = "plot1.png", width = 480, height = 480)

#plot histogram
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")

dev.off()