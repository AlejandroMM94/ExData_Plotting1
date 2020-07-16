# Reading y subsetting the data
data <- read.table("exdata./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
library(dplyr)
dataset <- filter(data, Date %in% c("1/2/2007","2/2/2007"))

# Creating a new column called DataTime 
dataset$Date <- as.Date(dataset$Date, format= "%d/%m/%Y")
datetime <- paste(dataset$Date, dataset$Time)
dataset <- mutate(dataset, DateTime = as.POSIXct(datetime))

# Opening a png file
png(filename = "plot3.png", width = 480, height = 480) 

# Creating a Time series plot using the Sub_meterings and DateTime columns
with(dataset, plot(Sub_metering_1~DateTime, type = "l", ylab="Energy sub metering", xlab=""))
lines(dataset$DateTime, dataset$Sub_metering_2, col = "red")
lines(dataset$DateTime, dataset$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 2)

# Closing device
dev.off()
