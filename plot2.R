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

# create Date and Time variable
# df$Date <- as.Date(df$Date, "%d/%m/%Y")
df$dateTime <- strptime(paste(df$Date, df$Time, sep=" "),
                format = "%d/%m/%Y %H:%M:%S")
# df$weekday <- as.factor(weekdays(df$Date, abbreviate = TRUE))

# make line plot /Plot 2
 png(filename = "plot2.png", 
    width = 480, 
    height = 480, 
    units = "px")

with (df, plot(df$dateTime, df$Global_active_power,
               type = "l",
               ylab = "Global Active Power (kilowatts)",
               xlab = ""))

dev.off()