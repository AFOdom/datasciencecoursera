#Set working directory
setwd("~/datasciencecoursera/getting_and_cleaning_data")

#Read in raw data from X_test(test result data),subject_test(subjects the test
#data came from), and y_test(activities the results came from)
test_raw <- read.table("raw_data/test/X_test.txt")
test_subjects <- 
        read.table("raw_data/test/subject_test.txt")
test_activities <- 
        read.table("raw_data/test/y_test.txt")

#Give variables in test subject and activity tables readable names
colnames(test_subjects) <- c("subject")
colnames(test_activities) <- c("activity")

#Put all test data together in one table
test_data <- cbind(test_subjects,test_activities,test_raw)

#Read in raw data from X_train(training result data),subject_train (subjects the 
#training data came from) and y_train(activities the results came from)
train_raw <- read.table("raw_data/train/X_train.txt")
train_subjects <- read.table("raw_data/train/subject_train.txt")
train_activities <- read.table("raw_data/train/y_train.txt")

#Give variables in training subject and activity tables readable names
colnames(train_subjects) <- c("subject")
colnames(train_activities) <- c("activity")

#Put all training data together in one table
train_data <- cbind(train_subjects,train_activities,train_raw)

#Read in activity labels and labels for what the test and training results are 
#measuring
activity_labels <-read.table("raw_data/activity_labels.txt",
                             stringsAsFactors=FALSE)
measure_labels <- read.table("raw_data/features.txt",stringsAsFactors=FALSE)

#Merge tables together and provide readable variable names
all_data <- merge(test_data,train_data,all=TRUE)
names(all_data) <- c("subject","activity",measure_labels$V2)

#Subset data to have only the mean, std, subject, and activity variables
mean_std_data <- all_data[,grep("mean|std|subject|activity",colnames(all_data),
                                ignore.case=TRUE)]

#replace activity codes with readable labels
 for (i in 1:nrow(mean_std_data)){
        for(j in 1:6){
                if (mean_std_data$activity[i]==j)
                       mean_std_data$activity[i]=activity_labels[j,2]
        }
}

#Make subject and activity cols into factors, so we can group by them
mean_std_data$subject <- factor(mean_std_data$subject)
mean_std_data$activity <- factor(mean_std_data$activity)

#Aggregate by subject and activity to get means for all the variables in data.
#Assign to tidy_data, because we're creating our final product.
tidy_data <- 
        aggregate(mean_std_data[3:88],
                  by=list(mean_std_data$subject,mean_std_data$activity),
                  FUN=mean)
colnames(tidy_data)[1]<-c("Subject")
colnames(tidy_data)[2]<-c("Activity")

write.table(tidy_data,file="tidy_data.txt")
