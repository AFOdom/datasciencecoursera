#---------------
# ASSIGNMENT
#
# The American Community Survey distributes downloadable data about 
# United States communities. Download the 2006 microdata survey about housing 
# for the state of Idaho using download.file() from here: 
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv 
#
# and load the data into R. The code book, describing the variable names is here: 
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 
#
# Apply strsplit() to split all the names of the data frame on the characters 
# "wgtp". What is the value of the 123 element of the resulting list?
#
#------------------


#read in data
#for some reason, putting this on multiple lines didn't work here ???
house_data <- read.csv("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", header=TRUE,stringsAsFactors=FALSE)

#split column names of house_data on the value "wgtp". strsplit() expects
#regular expression to split on. "fixed=TRUE" tells it to use
#the exact value "wgtp"
splitNames <- strsplit(names(house_data),"wgtp",fixed=TRUE)

#returns the 123 value in the splitNames list. NOTE: I originally had
#splitNames <- splitNames[[123]], which changed the original value of 
#splitNames to contain just the 123rd element. This generated a subscript
#error, because code could not resolve on a 123rd element when splitNames
#had been turned into a list of 2 things (the value of element 123).
#Lesson: if you want to assign this to a variable, 
#give it a different name. (derp)
splitNames[[123]]
