initial <- read.table("household_power_consumption.txt", nrows=100, sep = ";", header = T)
colNames <- names(initial)
df <- read.table("household_power_consumption.txt", sep = ";", col.names = colNames,
                 skip = 21997, nrows = 2880)
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
png(filename = 'figure/plot2.png', height = 480, width = 480, units = "px", bg = "white")
with(df, plot(Global_active_power, type="l", xlab = "", ylab="Global Active Power (kilowatts)",
     ylim = c(0, 4), xaxt = "n"))
axis(1, at=c(1, 1440, 2880), labels=c('Thu', 'Fri', 'Sat'))
dev.off()