
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

# Code that creates PNG file
png(filename = 'plot1.png', width = 480, height = 480)


# Generate Plot 1
hist(fdata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="red",ylim = c(0, 1200))

dev.off()