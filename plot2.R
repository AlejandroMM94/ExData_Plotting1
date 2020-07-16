# Reading y subsetting the data 
data <- read.table("exdata./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
library(dplyr)
dataset <- filter(data, Date %in% c("1/2/2007","2/2/2007"))

# Creating a new column called DataTime 
dataset$Date <- as.Date(dataset$Date, format= "%d/%m/%Y")
datetime <- paste(dataset$Date, dataset$Time)
dataset <- mutate(dataset, DateTime = as.POSIXct(datetime))

# Opening a png file
png(filename = "plot2.png", width = 480, height = 480)

# Creating a Time series plot using the Global_active_power and DateTime columns
with(dataset, plot(Global_active_power~DateTime, type = "l", ylab="Global Active Power (kilowatts)", xlab=""))

# Closing device
dev.off()
