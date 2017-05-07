
df <- file("household_power_consumption.txt")
pdata <- read.table(df, sep=";", na.strings="?", header = TRUE)

# Filter data with dates 2/1/2007 and 2/2/2007
fdata <- pdata[pdata$Date %in% c("1/2/2007","2/2/2007"),]

# Convert Date Time to DateTime 
dtime <- paste(as.Date(fdata$Date), fdata$Time)
ftime$Datetime <- as.POSIXct(dtime)

# Combine ftime and fdata
fdata <- cbind(ftime,fdata)

# Generating Plot 3
columnlines <- c("black", "red", "blue")
lbl <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(fdata$DateTime, fdata$Sub_metering_1, col=columnlines[1], xlab="", ylab="Energy sub metering", type="l")
lines(fdata$DateTime, fdata$Sub_metering_2, col=columnlines[2])
lines(fdata$DateTime, fdata$Sub_metering_3, col=columnlines[3])
legend(legend=lbl, col=columnlines, lty="solid","topright")