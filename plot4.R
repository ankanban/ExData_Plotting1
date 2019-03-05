initial <- read.table("household_power_consumption.txt", nrows=100, stringsAsFactors = FALSE, sep = ";", header = T, na.strings="?")
colNames <- names(initial)
df <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep = ";", col.names = colNames,
                 skip = 66637, nrows = 2880, na.strings="?")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
png(filename = 'plot4.png', height = 480, width = 480, units = "px", bg = "white")

# intialize the canvas for 2x2 plots
par(mfrow = c(2, 2))

# 1st subplot
with(df, plot(Global_active_power, type="l", xlab = "", ylab="Global Active Power (kilowatts)",
              xaxt = "n"))
axis(1, at=c(1, 1440, 2880), labels=c('Thu', 'Fri', 'Sat'))

# 2nd subplot
with(df, plot(Voltage, type="l", xlab = "datetime", ylab="Voltage",
              xaxt = "n"))
axis(1, at=c(1, 1440, 2880), labels=c('Thu', 'Fri', 'Sat'))

# 3rd subplot
with(df, plot(Sub_metering_1,
              type="l", xlab = "", ylab="Energy sub metering",
              col = "black", xaxt = "n"))
lines(df$Sub_metering_2, col="red")
lines(df$Sub_metering_3, col="blue")
legend("topright", lwd = 2, bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"))
axis(1, at=c(1, 1440, 2880), labels=c('Thu', 'Fri', 'Sat'))

# 4th subplot
with(df, plot(Global_reactive_power, type="l", xlab = "datetime", ylab="Global_reactive_power",
              xaxt = "n"))
axis(1, at=c(1, 1440, 2880), labels=c('Thu', 'Fri', 'Sat'))

# End
dev.off()
