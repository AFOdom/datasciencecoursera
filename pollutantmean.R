pollutantmean <- function(directory,pollutant, id=1:332){
        
        ## Set up vector to hold running sum of pollutant values across
        ## monitor files
        all_pollutant_values <- c()
      
        ## Cycle through all monitor numbers passed through id argument.
        ## Construct filename to open relevant monitor file and take
        ## mean of that monitor's records for the pollutant passed
        ## in using the "pollutant" argument
        for (i in id){
                ## Convert number to 3 digit string with preceding zeros 
                filename <- sprintf("%03d.csv",i)
              
                ## Combine directory and filename to get complete filename
                long_filename <- paste(directory,filename,sep="/")
              
                ## Read data from relevant monitor file into table
                monitor_data <- read.table(long_filename,header=TRUE,",")
              
                ## Get the mean of the pollutant records in this file
                all_pollutant_values <- append(all_pollutant_values, 
                                              monitor_data[ , pollutant])
               
      }
      
      ## Take the means of all the monitor means we've collected for the
      ##specified pollutant
      mean(all_pollutant_values, na.rm=TRUE)
}