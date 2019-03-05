initial <- read.table("household_power_consumption.txt", nrows=100, stringsAsFactors = FALSE, sep = ";", header = T, na.strings="?")
colNames <- names(initial)
df <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep = ";", col.names = colNames,
                 skip = 66637, nrows = 2880, na.strings="?")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
png(filename = 'plot3.png', height = 480, width = 480, units = "px", bg = "white")
with(df, plot(Sub_metering_1,
              type="l", xlab = "", ylab="Energy sub metering",
              col = "black", xaxt = "n"))
lines(df$Sub_metering_2, col="red")
lines(df$Sub_metering_3, col="blue")
legend("topright", lwd = 2,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"))
axis(1, at=c(1, 1440, 2880), labels=c('Thu', 'Fri', 'Sat'))
dev.off()