df <- file("household_power_consumption.txt")
pdata <- read.table(df, sep=";", na.strings="?", header = TRUE)

# Filter data with dates 2/1/2007 and 2/2/2007
fdata <- pdata[pdata$Date %in% c("1/2/2007","2/2/2007"),]

# Convert Date Time to DateTime 
dtime <- paste(as.Date(fdata$Date), fdata$Time)
ftime$Datetime <- as.POSIXct(dtime)

# Combine ftime and fdata
fdata <- cbind(ftime,fdata)

# Generating Plot 4
lbl <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(fdata$DateTime, fdata$Global_active_power, xlab="", ylab="Global Active Power", col="black", type="l")
plot(fdata$DateTime, fdata$Voltage, xlab="datetime", ylab="Voltage", col="black", type="l")
plot(fdata$DateTime, fdata$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
lines(fdata$DateTime, fdata$Sub_metering_2, col="red", type="l")
lines(fdata$DateTime, fdata$Sub_metering_3, col="blue", type="l")
legend(legend=lbl, lty=1, col=columnlines, "topright",bty="n")
plot(fdata$DateTime, fdata$Global_reactive_power, xlab="datetime", 
     ylab="Global_reactive_power", col="black", type="l")