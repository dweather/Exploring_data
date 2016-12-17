### Exploratory Final Project

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)

## Question 2
baltimore <- filter(NEI, fips == "24510")
baltimore <- summarise(baltimore, Total_PMI25 = sum(Emissions))
png(filename = "plot2.png")
plot(baltimore, type = "lm", main = "Baltimore PM2.5 Over Time",
     xlab = "Year", ylab = "Total PM 2.5", col = "Red", lwd = 3)
dev.off()





