pollutantmean <- function(directory,pollutant, id=1:332){
        
        ## If the function has just been called, set "first" to true.
        ## Used to build the vector of all means from all monitors.
        first <- TRUE
      
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
                this_pollutant_mean<-mean(monitor_data[, pollutant],na.rm=TRUE)
        
                test_variable <- paste(filename, this_pollutant_mean, sep="=")
                print(test_variable)
              
                ## If this is the first time we are cycling through the
                ## loop, create the vector all_means to store the means
                ## of the relevant pollutant from this and all 
                ## subsequent files. Else, append this_pollutant_mean 
                ## to the exsiting all_means vector
                if (first){
                        all_means <- c(this_pollutant_mean)
                        first=FALSE
                } else {
                        all_means<-append(all_means,this_pollutant_mean)  
                } 
      }
      
      print(all_means)
      ## Take the means of all the monitor means we've collected for the
      ##specified pollutant
      mean(all_means, na.rm=TRUE)
}