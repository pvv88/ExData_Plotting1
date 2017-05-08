
df <- file("../household_power_consumption.txt")
pdata <- read.table(df, sep=";", na.strings="?", header = TRUE)

# Filter data with dates 2/1/2007 and 2/2/2007
fdata <- pdata[pdata$Date %in% c("1/2/2007","2/2/2007"),]

# Convert Date Time to DateTime 
fdata$Date <- as.Date(fdata$Date, format = "%d/%m/%Y %H:%M:%S")
dtime <- paste(as.Date(fdata$Date), fdata$Time)
ftime <- as.POSIXct(dtime)


# Combine ftime and fdata
fdata <- cbind(ftime,fdata)

# Combine ftime and fdata
png(filename = 'plot4.png', width = 480, height = 480)

# Generating Plot 4
lbl <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(fdata$ftime, fdata$Global_active_power, xlab="", ylab="Global Active Power", col="black", type="l")
plot(fdata$ftime, fdata$Voltage, xlab="datetime", ylab="Voltage", col="black", type="l")
plot(fdata$ftime, fdata$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
lines(fdata$ftime, fdata$Sub_metering_2, col="red", type="l")
lines(fdata$ftime, fdata$Sub_metering_3, col="blue", type="l")
legend(legend=lbl, lty=1, col=columnlines, "topright",bty="n")
plot(fdata$ftime, fdata$Global_reactive_power, xlab="datetime", 
     ylab="Global_reactive_power", col="black", type="l")
dev.off();