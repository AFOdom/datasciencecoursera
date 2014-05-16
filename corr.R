corr <- function(directory, threshold = 0) {
  
        correlations <- c()
        all_complete_cases <- complete("specdata")
        #print(all_complete_cases)
        just_nobs <- all_complete_cases[,"nobs"]
        #print("all of just nobs is:")
        #print(just_nobs)
              
        for (i in 1:332){
                #current_case <- all_complete_cases[i,]
                #threshold_test_number <- current_case["nobs"]
                #print(paste("# complete cases id", i, "is", 
                 #           threshold_test_number,sep=" "))
                #print (paste("i is", i, sep=" "))
                #print (paste("just_nobs is",just_nobs[i], sep=" "))
                if (just_nobs[i] > threshold){
                        
                        #print("in the if statement")
                        
                        ## Convert id# to 3 digit string with preceding zeros 
                        filename <- sprintf("%03d.csv",i)
                        
                        ## Combine directory and filename to get complete filename
                        long_filename <- paste(directory,filename,sep="/")
                        
                        ## Read data from relevant monitor file into table
                        monitor_data <- read.table(long_filename,
                                                   header=TRUE,",")
                        
                        ## Create logical vector indicating which cases are complete
                        complete_test <- complete.cases(monitor_data)
                        
                        ## use logical vector to create data frame containing only
                        ## complete cases
                        complete_cases <- monitor_data[complete_test,]
                        this_correlation <-cor(complete_cases["sulfate"], 
                                               complete_cases["nitrate"])
                        correlations <- append(correlations,
                                               format(
                                                   round(this_correlation,5),
                                                        nsmall=5))
                        #print(correlations)
                        
                } 
                
                
        }
        correlations
               
}