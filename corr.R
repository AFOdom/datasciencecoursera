corr <- function(directory, threshold = 0) {
  
        correlations <- c() #vector to hold correlation calculations
        
        #dataframe holding number of complete cases for each monitor ID
        all_complete_cases <- complete("specdata")
              
        #For all monitors, take the ones that have a number of complete
        #cases above the threshold, calculate correlations between 
        #nitrate and sulfate, and append them to the correlations vector
        for (i in 1:332){
                
                #take the current monitor and get the number of complete cases
                #for that monitor
                current_monitor <- all_complete_cases[i,]
                threshold_test_number <- current_monitor["nobs"]

                if (threshold_test_number > threshold){
                        
                        ## Convert id# to 3 digit string with preceding zeros 
                        filename <- sprintf("%03d.csv",i)
                        
                        ## Combine directory & filename to get cmplte filename
                        long_filename <- paste(directory,filename,sep="/")
                        
                        ## Read data from relevant monitor file into table
                        monitor_data <- read.table(long_filename,
                                                   header=TRUE,",")
                        
                        ## Logical vector indicating which cases are complete
                        complete_test <- complete.cases(monitor_data)
                        
                        ## use logical vector to create data frame containing 
                        ## only complete cases
                        complete_cases <- monitor_data[complete_test,]
                        
                        ## Take correlation of nitrate and sulfate for 
                        ## all complete cases and append them to correlations
                        ## vector
                        correlations <- append(correlations,
                                               cor(complete_cases["sulfate"],
                                                   complete_cases["nitrate"]))
  
                } 
                                
        }

        correlations
               
}