# Set variables for expected rows and columns
exp_rows <- 2075259L
exp_cols <- 9L

# Set variables to download file
file_url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
txt_file_name <- 'household_power_consumption.txt'
zip_file_name <- 'household_power_consumption.zip'

# Check if the data file exists. If not, download and unzip
if(!file.exists(txt_file_name)){
  if(!file.exists(zip_file_name)){
    download.file(file_url,zip_file_name, mode = 'wb' )
  }
  
  unzip(zip_file_name)
}

# Read the data file into a data frame
power <- read.table(txt_file_name, header = TRUE,sep = ';'
                    , stringsAsFactors = FALSE, na.strings = '?')

# Check number of rows and columns
stopifnot( nrow(power) == exp_rows)
stopifnot( ncol(power) == exp_cols)

# Create date and time variables
power$date_new <- as.Date(power$Date, '%d/%m/%Y')
power$date_time <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")

# Subset data
date_ini <- as.Date('01/02/2007', '%d/%m/%Y')
date_end <- as.Date('02/02/2007', '%d/%m/%Y')
power <- subset (power,  date_new >= date_ini & date_new <= date_end)


