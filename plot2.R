
df <- file("household_power_consumption.txt")
pdata <- read.table(df, sep=";", na.strings="?", header = TRUE)

# Filter data with dates 2/1/2007 and 2/2/2007
fdata <- pdata[pdata$Date %in% c("1/2/2007","2/2/2007"),]

# Convert Date Time to DateTime 
dtime <- paste(as.Date(fdata$Date), fdata$Time)
ftime$Datetime <- as.POSIXct(dtime)

# Combine ftime and fdata
fdata <- cbind(ftime,fdata)

# Generating Plot 2
# 
plot(fdata$DateTime, fdata$Global_active_power, 
      xlab="", ylab="Global Active Power (kilowatts)", col="black", type="l")
