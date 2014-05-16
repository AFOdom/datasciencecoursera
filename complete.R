complete <- function (directory, id = 1:332){
        
        ids <- c() ##vector to hold id numbers
        nobs <- c() ## vector of number of complete cases for each id
        for (i in id){
                ## Put the id onto the ids vector
                ids <- append(ids,i)
                
                ## Convert number to 3 digit string with preceding zeros 
                filename <- sprintf("%03d.csv",i)
                
                ## Combine directory and filename to get complete filename
                long_filename <- paste(directory,filename,sep="/")
                
                ## Read data from relevant monitor file into table
                monitor_data <- read.table(long_filename,header=TRUE,",")
                
                ## Create logical vector indicating which cases are complete
                complete_test <- complete.cases(monitor_data)
                
                ## use logical vector to create data frame containing only
                ## complete cases
                complete_case_frame <- monitor_data[complete_test,]
                
                ## Append the number of rows to nobs
                nobs <- append(nobs, nrow(complete_case_frame))
        }
        
        ## Create data frame out of ids and nobs to get number of complete
        ## cases by id.
        num_complete_cases_by_id <- data.frame(ids,nobs)
        num_complete_cases_by_id
}