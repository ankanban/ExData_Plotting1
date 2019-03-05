initial <- read.table("household_power_consumption.txt", nrows=100, stringsAsFactors = FALSE, sep = ";", header = T, na.strings="?")
colNames <- names(initial)
df <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep = ";", col.names = colNames,
                 skip = 66637, nrows = 2880, na.strings="?")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
png(filename = 'plot2.png', height = 480, width = 480, units = "px", bg = "white")
with(df, plot(Global_active_power, type="l", xlab = "", ylab="Global Active Power (kilowatts)",
     xaxt = "n"))
axis(1, at=c(1, 1440, 2880), labels=c('Thu', 'Fri', 'Sat'))
dev.off()