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
with( power, plot (date_time, Global_active_power, type = 'l'
                   , xlab = ''
                   , ylab ='Global Active Power (kilowatts)') )

# Copy the plot to a PNG file
dev.copy(png, file = "plot2.png")
dev.off()