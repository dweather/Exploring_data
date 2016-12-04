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

# plot1.png
## Make Corresponding Plot
png(filename = "plot1.png")
hist(data$Global_active_power, breaks = 11, col = "red",
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

