initial <- read.table("household_power_consumption.txt", nrows=100, sep = ";", header = T)
colNames <- names(initial)
df <- read.table("household_power_consumption.txt", sep = ";", col.names = colNames,
                 skip = 21997, nrows = 2880)
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
png(filename = 'plot3.png', height = 480, width = 480, units = "px", bg = "white")
with(df, plot(Sub_metering_1,
              type="l", xlab = "", ylab="Energy sub metering",
              col = "black", ylim = c(0, 25), xaxt = "n"))
lines(df$Sub_metering_2, col="red")
lines(df$Sub_metering_3, col="blue")
# legend(1875, 26, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  col = c("black", "red", "blue"))
legend("topright", lwd = 2,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"))
axis(1, at=c(1, 1440, 2880), labels=c('Thu', 'Fri', 'Sat'))
dev.off()