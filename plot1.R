initial <- read.table("household_power_consumption.txt", nrows=100, sep = ";", header = T)
colNames <- names(initial)
df <- read.table("household_power_consumption.txt", sep = ";", col.names = colNames,
                 skip = 21997, nrows = 2880)
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
png(filename = 'plot1.png', height = 480, width = 480, units = "px", bg = "white")
hist(df$Global_active_power, main="Global Active Power", 
      xlab="Global Active Power (kilowatts)", ylab="Frequency",
      col = "red", ylim = c(0, 800), xlim = c(0, 4))
dev.off()