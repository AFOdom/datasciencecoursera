best <- function (state, outcome){
        ## Read outcome data
        outcome_raw <- read.csv("outcome-of-care-measures.csv", 
                                colClasses="character")
        df_raw=NULL
        state_subset = NULL
        best_hospital = NULL
        if (outcome=="heart attack"){
                df_raw <- data.frame(state_name=outcome_raw[,7],
                                     hospital=outcome_raw[,2],
                                     heart_attack=outcome_raw[,11])
                state_subset_raw <- subset(df_raw,state_name==state,
                                           select=c(
                                                   state_name,hospital,
                                                   heart_attack))
                state_subset_NA <- sapply(state_subset_raw,function(x) {
                        is.na(x)<-which(x=="Not Available");x})
                state_subset_clean <- na.omit(state_subset_NA)
                state_subset_coerced <- data.frame(state_subset_clean,
                                                   stringsAsFactors = FALSE)
                state_subset <- state_subset_coerced[order
                                (as.numeric(state_subset_coerced$heart_attack)),]
                             
        } else if(outcome=="heart failure"){
                df_raw <- data.frame(state_name=outcome_raw[,7],
                                     hospital=outcome_raw[,2],
                                     heart_failure=outcome_raw[,17])
                state_subset_raw <- subset(df_raw,state_name==state,
                                           select=c(
                                                   state_name,hospital,
                                                   heart_failure))
                state_subset_NA <- sapply(state_subset_raw,function(x) {
                        is.na(x)<-which(x=="Not Available");x})
                state_subset_clean <- na.omit(state_subset_NA)
                state_subset_coerced <- data.frame(state_subset_clean,
                                                   stringsAsFactors = FALSE)
                state_subset <- state_subset_coerced[order
                        (as.numeric(state_subset_coerced$heart_failure)),] 
        } else if(outcome=="pneumonia"){
                df_raw <- data.frame(state_name=outcome_raw[,7],
                                     hospital=outcome_raw[,2],
                                     pneumonia=outcome_raw[,23])
                
                state_subset_raw <- subset(df_raw,state_name==state,
                                           select=c(
                                                   state_name,hospital,
                                                   pneumonia))
                state_subset_NA <- sapply(state_subset_raw,function(x) {
                        is.na(x)<-which(x=="Not Available");x})
                state_subset_clean <- na.omit(state_subset_NA)
                state_subset_coerced <- data.frame(state_subset_clean,
                                                   stringsAsFactors = FALSE)
                state_subset <- state_subset_coerced[order
                                (as.numeric(state_subset_coerced$pneumonia)),]
        } else {
                stop("invalid outcome",call.=TRUE)
        }
        
        if (!(is.na(state_subset[1,1]))){
        best_hospital <- as.character(state_subset[1,2]) 
        best_hospital
        } else {
                stop("invalid state",call.=TRUE)  
        }
}

## heart_failure=outcome[,17],
## pneumonia=outcome[,23])