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
df$dateTime <- strptime(paste(df$Date, df$Time, sep=" "),
                format = "%d/%m/%Y %H:%M:%S")

# open png device
 png(filename = "plot4.png", 
    width = 480, 
    height = 480, 
    units = "px")

# setup for multiple plots 2x2, fill by column
par(mfcol = c(2,2))

# make line plot UL
with (df, plot(df$dateTime, df$Global_active_power,
               type = "l",
               ylab = "Global Active Power",
               xlab = ""))

# make line plot 3, LL
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
        bty = "n",
        lwd = 1,
        lty = 1,
        col = c("black", "red", "blue"), 
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        )

# make line plot, UR
with (df, plot(df$dateTime, df$Voltage,
               type = "l",
               ylab = "Voltage",
               xlab = "datetime" ))

# make line plot, LR
with (df, plot(df$dateTime, df$Global_reactive_power,
               type = "l",
               ylab = "Global_reactive_power",
               xlab = "datetime" ))



dev.off()