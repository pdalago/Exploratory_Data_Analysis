## loading dataset
data_full <- read.csv("household_power_consumption.txt",header=T, sep=';',na.string="?",
                     nrows=2075259, check.names=F, stringsAsFactors= F, comment.char="",quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Subsetting the dataset
data <-subset (data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

## Conversion of the dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Second Plot
plot(data$Global_active_power~data$Datetime,
     ylab="Global Active Power (kilowatts)", xlab="")
     
## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
