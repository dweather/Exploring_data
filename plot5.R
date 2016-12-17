### Exploratory Final Project

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)

## Question 5
baltimore <- filter(NEI, fips == "24510")
motor <-  filter(SCC, grepl("Vehicle", Short.Name))$SCC 
motor_balt <- filter(baltimore, SCC %in% motor)
motor_balt <- group_by(motor_balt, year)
motor_balt_summary <- summarise(motor_balt, Total_PMI25 = sum(Emissions))
png(filename = "plot5.png")
plot(motor_balt_summary, type = "lm", 
     main = "Baltimore PM2.5 from Vehicle Sources Over Time",
     xlab = "Year", ylab = "Vehicle Sources PM 2.5", col = "Red", lwd = 3)
dev.off()





