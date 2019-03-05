df <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep = ";", header = T, na.strings="?")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df <- df[df$Date == as.Date("2007-02-01") | df$Date == as.Date("2007-02-02"),]
df$datetime <- strptime(paste(df$Date,df$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")


hist(df$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency",
     col = "red")