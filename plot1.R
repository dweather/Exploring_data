### Exploratory Final Project

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)

## Question 1
NEI <- group_by(NEI, year)
summary <- summarise(NEI, Total_PMI25 = sum(Emissions))
png(filename = "plot1.png")
plot(summary, type = "lm", main = "Total PM2.5 Over Time",
     xlab = "Year", ylab = "Total PM 2.5", col = "Red", lwd = 3)
dev.off()





