install.packages("data.table")
library(data.table)
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileurl,"idaho_housing.csv",method="curl")
data <- read.csv("idaho_housing.csv")

