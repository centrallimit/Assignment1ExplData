################################################################################
#
# Project: Coursera - Exploratory Data Analysis
# Plot 3
# 
###############################################################################
library(dplyr)
library(lubridate)
library(graphics)
library(grDevices)
# Read data
DF <- read.table("household_power_consumption.txt", header = TRUE, sep  =";",
                 na.strings = "?")

DF$Date <- dmy(DF$Date)

# Filter data 2007/2/1 and 2007/2/2
DF_NEW <- DF %>%
        filter(year(Date) == 2007 & month(Date) == 2 & (day(Date) == 1 | day(Date) == 2))


# Open PNG device
png(filename = "plot3.png", width = 480, height = 480, units ="px")

plot(DF_NEW$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", 
     ylim = c(0.0, 40.0), axes = FALSE)
box(which = "plot")

par(new = TRUE)

plot(DF_NEW$Sub_metering_2, type = "l", ylab = "", xlab = "", 
     ylim = c(0.0, 40.0), axes = FALSE, col = "red")
par(new = TRUE)

plot(DF_NEW$Sub_metering_3, type = "l", ylab = "", xlab = "",
     ylim = c(0.0, 40.0), axes = FALSE, col = "blue")
axis(1, at = c(0,1440,2880), labels = c("Thu", "Fri", "Sat"), pos = NA)
axis(2, at = c(10, 20 , 30))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue") ,lty = c(1, 1, 1))
dev.off()