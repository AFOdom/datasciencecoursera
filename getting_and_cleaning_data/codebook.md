---
title: "codebook.md"
author: "AFOdom"
date: "July 26, 2014"
output: pdf_document
---

tidy_data.txt - VARIABLE DEFINITIONS

SUBJECT 
* The numeric id of the human subject the data is from. 
* Value ranges from 1 to 30

ACTIVITY
* Types of activity measured in the data
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

THE REST OF THE FEATURE SET
(AFO: The explanation below was taken directly from the original data's 
explanation for these variables. In the tidy data set produced by the 
runanalysis.r script, only the mean() and std() variables for each signal were 
used. There were many more variables for each signal in the orignal data.)

==START QUOTE==
The features selected for this database come from the accelerometer and 
gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain 
signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass 
Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity 
acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low 
pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived 
in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
Also the magnitude of these three-dimensional signals were calculated 
using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, 
tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals 
producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, 
fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain 
signals). 

These signals were used to estimate variables of the feature vector for 
each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z 
directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals in the tidy data 
are: 

mean(): Mean value
std(): Standard deviation

These variables from the origingal data set do not appear in the tidy data set:

mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.
==END QUOTE==