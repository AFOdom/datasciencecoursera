# ------------
# ASSIGNMENT
#
# Load the Gross Domestic Product data for the 190 ranked countries in this 
# data set: 
# 
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 
#
# Remove the commas from the GDP numbers in millions of dollars and average 
# them. What is the average? 
#
# Original data sources: 
#
# http://data.worldbank.org/data-catalog/GDP-ranking-table
# ------------

# Read in the data without headers, skipping the first 5 trash rows, and 
# avoiding stringsAsFactors complication
gdp_data <- read.csv("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",header=FALSE, stringsAsFactors=FALSE,skip=5)

# Take only the rank and gdp columns from the data.
# Clean up gdp data: trim leading and trailing white space, remove commas
# Suppress warnings, because the only warning that comes up is about
# coercing to NA, and we WANT to do that coercion. So STFU.
subset_gdp_millions <- suppressWarnings(data.frame(as.numeric(gdp_data$V2),as.numeric(str_trim(gsub(",","",gdp_data$V5)))))

# Convert everything to numeric type. Set column names to something readable.
names(subset_gdp_millions) <- c("rank","gdp")

# Carve out only the countries that are ranked. Take the mean of their GDP.
tidy_gdp <- subset(subset_gdp_millions,subset_gdp_millions$rank <= 190)
mean(tidy_gdp$gdp)




