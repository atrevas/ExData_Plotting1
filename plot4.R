# Set variable with the name of the data frame
df_name <- 'power'

# Check whether the data frame exists. If not source code to build it
if ( !(exists(df_name) && is.data.frame(get(df_name))) ){
  
  # Load and execute the R code in charge of reading and filtering the data
  source('read_data.R')
  
}

# Necessary to diplay week days in English
Sys.setlocale("LC_TIME", "English")

# Build the plot

# The plot will be written directly to a file, as it does not look well in RStudio
png(file = "plot4.png")

par(mfrow = c(2, 2))
with( power, {
  # First plot, line 1, column 1
  plot (date_time, Global_active_power, type = 'l', xlab = ''
        , ylab ='Global Active Power (kilowatts)')
  
  # Second plot, line 1, column 2
  plot (date_time, Voltage, type = 'l',ylab ='Voltage')
  
  # Third plot, line 2, column 1
  plot(date_time, Sub_metering_1, type = 'l', col = 'black'
       , xlab = '', ylab = 'Energy sub metering')
  lines(date_time, Sub_metering_2, col = 'red')
  lines(date_time, Sub_metering_3, col = 'blue')
  legend( 'topright', lty = 1, col = c('black', 'red', 'blue')
          , legend = c('Sub_metering_1'
          , 'Sub_metering_2', 'Sub_metering_2'), cex = 0.5)
  
  # Fourth plot, line 2, column 2
  plot (date_time, Global_reactive_power, type = 'l',
        ylab ='Global_reactive_power')
  
})

# Close the device in order to write the plot to the png file
dev.off()