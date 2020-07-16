# Reading y subsetting the data the data
data <- read.table("exdata./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
library(dplyr)
dataset <- filter(data, Date %in% c("1/2/2007","2/2/2007"))

# Opening a png file
png(filename = "plot1.png", width = 480, height = 480)

# Creating histogram from Global_active_power column
hist(dataset$Global_active_power, col = "red", xlab="Global Active Power (kilowatts)", ylab="Frequency", 
     main = "Global Active Power")

# Close png file
dev.off()