rankhospital <- function (state, outcome, num){
        ## Read outcome data
        outcome_raw <- read.csv("outcome-of-care-measures.csv", 
                                colClasses="character")
        
        hospital = NULL
        
        #whittle data down to what we want
        df_raw <- data.frame(state_name=outcome_raw[,7],
                             hospital=outcome_raw[,2],
                             heart_attack=outcome_raw[,11],
                             heart_failure=outcome_raw[,17],
                             pneumonia=outcome_raw[,23])
        
        # Get info for desired state
        state_HA <- subset(df_raw,state_name==state,
                                   select=c(
                                           state_name,hospital,
                                           heart_attack))
        state_HA_NA <- sapply(state_HA,function(x) {
                is.na(x)<-which(x=="Not Available");x})
        state_HA_clean <- na.omit(state_HA_NA)
        state_HA_coerced <- data.frame(state_HA_clean,
                                           stringsAsFactors = FALSE)
        state_HA <- state_HA_coerced[
                order(as.numeric(state_HA_coerced$heart_attack),
                      state_HA_coerced$hospital),]

        
        state_HF <- subset(df_raw,state_name==state,
                           select=c(
                                   state_name,hospital,
                                   heart_failure))
        state_HF_NA <- sapply(state_HF,function(x) {
                is.na(x)<-which(x=="Not Available");x})
        state_HF_clean <- na.omit(state_HF_NA)
        state_HF_coerced <- data.frame(state_HF_clean,
                               stringsAsFactors = FALSE)
        state_HF <- state_HF_coerced[
                order(as.numeric(state_HF_coerced$heart_failure),
                      state_HF_coerced$hospital),]
        #return(state_HF)
        
        state_PN <- subset(df_raw,state_name==state,
                           select=c(
                                   state_name,hospital, 
                                   pneumonia))
        state_PN_NA <- sapply(state_PN,function(x) {
                is.na(x)<-which(x=="Not Available");x})
        state_PN_clean <- na.omit(state_PN_NA)
        state_PN_coerced <- data.frame(state_PN_clean,
                                           stringsAsFactors = FALSE)
        state_PN <- state_PN_coerced[
                order(as.numeric(state_PN_coerced$pneumonia),
                      state_PN_coerced$hospital),]
        
        rank <- NULL
        if (num=="best"){rank <- 1}

        if (outcome=="heart attack"){
                if (is.null(rank)){
                        if (num=="worst"){ rank <- nrow(state_HA)}
                        else if (!(num > nrow(state_HA))){
                                rank <-num
                        }
                        else {return(NA)}
                }
                hospital <- state_HA[rank,2]
                
        } else if (outcome=="heart failure") {
                if (is.null(rank)){
                        if (num=="worst"){ rank <- nrow(state_HF)}
                        else if (!(num > nrow(state_HF))){
                                rank <-num
                        }
                        else {return(NA)}
                }
                hospital <- state_HF[rank,2]
                
        } else if (outcome=="pneumonia") {
                if (is.null(rank)){
                        if (num=="worst"){ rank <- nrow(state_PN)}
                        else if (!(num > nrow(state_PN))){
                                rank <-num
                        }
                        else {return(NA)}
                }
                hospital <- state_PN[rank,2]
        } else {stop("invalid outcome",call.=TRUE)}
        
        if (!(is.na(hospital))){
                hospital
        } else {
                stop("invalid state",call.=TRUE)  
        }
        
}