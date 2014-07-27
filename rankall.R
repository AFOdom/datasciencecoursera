rankall <- function(outcome,num) {
        ## Read outcome data
        outcome_raw <- read.csv("outcome-of-care-measures.csv", 
                                colClasses="character")
        
        #whittle data down to what we want
        df_raw <- data.frame(state_name=outcome_raw[,7],
                             hospital=outcome_raw[,2],
                             heart_attack=outcome_raw[,11],
                             heart_failure=outcome_raw[,17],
                             pneumonia=outcome_raw[,23])
        
        df_raw_NA <- sapply(df_raw,function(x) {
                is.na(x)<-which(x=="Not Available");x})
        df_raw_clean <- na.omit(df_raw_NA)
        df_raw_coerced <- data.frame(df_raw_clean,
                                       stringsAsFactors = FALSE)
        df_raw <- df_raw_coerced[
                order(df_raw_coerced$state_name),]
        
        urk <- split(df_raw,df_raw$state_names)
         return(urk)
        
        hospitals <- NULL
        
        return(df_raw)
}