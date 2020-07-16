# Reading y subsetting the data
data <- read.table("exdata./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
library(dplyr)
dataset <- filter(data, Date %in% c("1/2/2007","2/2/2007"))

# Creating a new column called DataTime 
dataset$Date <- as.Date(dataset$Date, format= "%d/%m/%Y")
datetime <- paste(dataset$Date, dataset$Time)
dataset <- mutate(dataset, DateTime = as.POSIXct(datetime))

# Opening a png file
png(filename = "plot4.png", width = 480, height = 480) 

#Establishing parameters
par(mfcol = c(2,2), mar = c(4, 4, 2, 1), oma = c(1, 0, 0, 0))

# Creating First Graph
with(dataset, plot(Global_active_power~DateTime, type = "l", ylab="Global Active Power (kilowatts)", xlab=""))

# Creating Second Graph
with(dataset, plot(Sub_metering_1~DateTime, type = "l", ylab="Energy sub metering", xlab=""))
lines(dataset$DateTime, dataset$Sub_metering_2, col = "red")
lines(dataset$DateTime, dataset$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 2, bty="n")

# Creating Third Graph
with(dataset, plot(Voltage~DateTime, type = "l", xlab = "datetime"))

# Creating Fourth Graph
with(dataset, plot(Global_reactive_power~DateTime, type = "l", xlab = "datetime"))

# Closing device
dev.off()
