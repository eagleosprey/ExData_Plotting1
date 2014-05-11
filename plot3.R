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

# make line plot /Plot 3
 png(filename = "plot3.png", 
    width = 480, 
    height = 480, 
    units = "px")

with (df, plot(df$dateTime, df$Sub_metering_1,
               type = "n",
               ylab = "Engergy sub metering",
               xlab = "" ))

with (df, points(df$dateTime, df$Sub_metering_1,
               type = "l"))
with (df, points(df$dateTime, df$Sub_metering_2,
               type = "l",
               col="red"))
with (df, points(df$dateTime, df$Sub_metering_3,
                 type = "l",
                 col="blue"))

legend ("topright", 
        lwd = 1,
        lty = 1,
        col = c("black", "red", "blue"), 
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        )


dev.off()