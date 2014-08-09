# Set variable with the name of the data frame
df_name <- 'power'

# Check whether the data frame exists. If not source code to build it
if ( !(exists(df_name) && is.data.frame(get(df_name))) ){
  
  # Load and execute the R code in charge of reading and filtering the data
  source('read_data.R')
  
}

# Necessary to diplay week days in English
Sys.setlocale("LC_TIME", "English")

# Find out which one has the largest values
# summary( power[, c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')])

# Build the plot
with( power, plot(date_time, Sub_metering_1, type = 'l', col = 'black'
                  , xlab = '', ylab = 'Energy sub metering') )

with( power, lines(date_time, Sub_metering_2, col = 'red') )
with( power, lines(date_time, Sub_metering_3, col = 'blue') )

legend( 'topright', lty = 1, col = c('black', 'red', 'blue')
      , legend = c('Sub_metering_1'
      , 'Sub_metering_2', 'Sub_metering_2'), cex = 0.7 )

# Copy the plot to a PNG file
dev.copy(png, file = "plot3.png")
dev.off()