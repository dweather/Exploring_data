## Week 1 Project 1 Exploratory Analysis

## Read in Data

data <- read.csv("data_123.txt", header=  TRUE, 
                 sep = ";", colClasses = "character")

## Filter Dates
##We will only be using data from the dates 2007-02-01 and 2007-02-02. 
##You may find it useful to convert the Date and Time variables to 
##Date/Time classes in R using the 𝚜𝚝𝚛𝚙𝚝𝚒𝚖𝚎()  and 𝚊𝚜.𝙳𝚊𝚝𝚎() functions.
library(dplyr)
dates <- c("1/2/2007", "2/2/2007")
data <- filter(data, Date %in% dates  )
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Time <- data$Time 
data$date_time <- paste0(data$Date," " , data$Time)
data$date_time <- strptime(data$date_time, "%d/%m/%Y %H:%M:%S")

# plot4.png
## Make Corresponding Plot
png(filename = "plot4.png")
par(mfrow = c(2,2))
plot(data$date_time, data$Global_active_power,  type= "l",
     ylab  = "Global Active Power (kilowatts)", xlab = "")
plot(data$date_time, data$Voltage,  type= "l",
     ylab  = "Voltage", xlab = "")
##Plot 3
plot(data$date_time, data$Sub_metering_1,  type= "l",
     ylab  = "Energy Sub Metering", xlab = "")
lines(data$date_time,data$Sub_metering_2, col = "red")
lines(data$date_time,data$Sub_metering_3, col = "blue")
legend("topright", lwd = 2, col= c("black","red", "blue"), 
       legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))

plot(data$date_time, data$Global_reactive_power,  type= "l",
     ylab  = "Global Reactive Power (kilowatts)", xlab = "")

dev.off()
