# Set variable with the name of the data frame
df_name <- 'power'

# Check whether the data frame exists. If not source code to build it
if ( !(exists(df_name) && is.data.frame(get(df_name))) ){
  
  # Load and execute the R code in charge of reading and filtering the data
  source('read_data.R')
  
}

# Build the plot
hist(power$Global_active_power, main = 'Global Active Power', col = 'orangered'
     , xlab = 'Global Active Power (kilowatts)')

# Copy the plot to a PNG file
dev.copy(png, file = "plot1.png")   
dev.off()
