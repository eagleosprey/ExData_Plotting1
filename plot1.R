# Used read.table("household_power_consumption.txt", 
#                  header = TRUE, sep = ";", nrows=15)
# to determine colClasses, sep, header

df<-read.table("household_power_consumption.txt", 
               header = TRUE,
               na.strings = "?", 
               sep = ";",
               colClasses = c("character", "character", "numeric", "numeric", 
                        "numeric", "numeric", "numeric", "numeric", "numeric"),
               nrows = 2076000
               )

# subset to the 2007-02-01 and 2007-02-02
df <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007" , ]

# convert Date and Time
df$Date <- as.Date(df$Date, "%d/%m/%Y")
#df$Time <- strptime(df$Time, "%H:%M:%S")

# make histrogram/Plot 1
png(filename = "plot1.png", 
    width = 480, 
    height = 480, 
    units = "px")

hist(df$Global_active_power, 
     col="red", 
     main="Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()