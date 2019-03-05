initial <- read.table("household_power_consumption.txt", nrows=100, stringsAsFactors = FALSE, sep = ";", header = T, na.strings="?")
colNames <- names(initial)
df <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep = ";", col.names = colNames,
                 skip = 66637, nrows = 2880, na.strings="?")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
png(filename = 'plot1.png', height = 480, width = 480, units = "px", bg = "white")
hist(df$Global_active_power, main="Global Active Power", 
      xlab="Global Active Power (kilowatts)", ylab="Frequency",
      col = "red")
dev.off()