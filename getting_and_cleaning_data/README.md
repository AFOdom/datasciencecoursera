---
title: "README.md"
author: AFOdom
date: July 26, 2014
output: pdf_document
---

The runanalysis.r script cleans the data from the data source below and puts it
in a format that allows for easy analysis of the mean() and std() variables
for each of the features measured in the data. See codebook.md for explanations
of the features and the shape of the final data.

datasource: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

additional description of the original data:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

WHAT THE SCRIPT DOES

1. Sets the working directory to the directory where the script is and where
the original data is contained.

2. Reads in the raw data from the X_test.txt file. This file contains the
561 variables for all the data that were collected - 17 variables per 
measured feature (see codebook.md). This data is stored in the table "test_raw".

3. Reads in the raw data from the subject_test.text. This file contains the 
list of subjects the results came from. This data is stored in the table 
"test_subjects".

4. Reads in the raw data from the y_test.txt. This file contains the list of
activities the subjects completed that were measured. This data is stored in
the table "test_activities".

5. Gives the variables in test_subjects and test_activities readable names: 
"subject" and "activity".

6. Puts all the above data into a single table called test_data which contains 
the following variables:
* subject
* activity
* all feature variables (see codebook.md)

7. Repeats steps 2 through 6 with the corresponding training files:
* X_train.txt to table "train_raw"
* subject_train.txt to table "train_subject"
* activity_train.txt to table "train_activities"
* Single table containing all variables: "train_data"

8. Reads in activity_labels.txt from the original data and stores it in 
table "activity_labels". This gives us readable labels that correspond to the 
activity codes in test_data and train_data.

9. Repeats step 8 with features.txt from the original data, which holds
the readable feature labels that provide the variable names for the feature
columns in both test_data and train_data. The labels are stored in the table
"measure_labels"

10. Merges the tables test_data and train_data together and provides readable
names for all the variables. This data is stored in the table "all_data"

11. Pulls subject, activity, and only the variables that contain data for 
"mean()" and "std()" for each feature. This subset of data is stored in the 
table "mean_std_data".

12. Replaces activity codes in the "mean_std_data" content with readable
labels from "activity_lables" (see step 8).

13. Makes subject and activity columns into factors, so they can be used
for grouping.

14. Aggregates the data by subject and activity to get the average of each
variable for each activity and each subject. Assigns this data to the table
"tidy_data".

15. Writes the table out to a file named "tidy_data.txt"

