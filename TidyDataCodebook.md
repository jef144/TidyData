#Data Sources
The tidy dataset SubjectActivities.csv was derived from experiments  conducted at the Universtiy of California, Irvine, which recorded signals from a smart phone acceleromter sensor.  The raw data (linear accleartion and angular velocity) was post-processed into multiple time and frequency domains and output into 561 variables.   More inmofrnation on the experimental design can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The actual data,  downloaded 2015-06-19,  is here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

#Experimental protocol
30 Subjects,  from the age of 19 to 48 years old,  wore a Samsung phone on their belt as they performed various Activites: (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).  Sensor data was recorded at 50HZ and then subjected to bandpass filtering and frequency analysis.    

#Variables
Of the 561 variables supplied by the researches,  only 79 used as input to this dataset:  SubjectActivities.   The variables selected were those which expressed Mean or a Standard deviation of the original data.    As part of this analysis we have further aggregated the data by taking the Mean of all observations,  by Subject and by Activity. 

An algorithm was applied to generate variable names for this dataset which a) preserve tracibility to the original variables,  b) are compliant with R naming conventions, and c) include a suffix, "_Mean"  to indicate the transformation performed by this analysis.   For example, this original name:
-tBodyAcc-mean()-X
is transformed into:
-tBodyAcc_mean_X_Mean

Here is a complete list of the dataset variables.   

SubjectID   -- numeric identifier of the human subject
ActivityID    -- one of the activies (WALKING,  etc)

The following variables are the mean of the mean, or the mean of the standard deviation. Please refer to the UCI site for more  detail on the experimental design. 

tBodyAcc_mean_X_Mean
tBodyAcc_mean_Y_Mean
tBodyAcc_mean_Z_Mean
tBodyAcc_std_X_Mean
tBodyAcc_std_Y_Mean
tBodyAcc_std_Z_Mean
tGravityAcc_mean_X_Mean
tGravityAcc_mean_Y_Mean
tGravityAcc_mean_Z_Mean
tGravityAcc_std_X_Mean
tGravityAcc_std_Y_Mean
tGravityAcc_std_Z_Mean
tBodyAccJerk_mean_X_Mean
tBodyAccJerk_mean_Y_Mean
tBodyAccJerk_mean_Z_Mean
tBodyAccJerk_std_X_Mean
tBodyAccJerk_std_Y_Mean
tBodyAccJerk_std_Z_Mean
tBodyGyro_mean_X_Mean
tBodyGyro_mean_Y_Mean
tBodyGyro_mean_Z_Mean
tBodyGyro_std_X_Mean
tBodyGyro_std_Y_Mean
tBodyGyro_std_Z_Mean
tBodyGyroJerk_mean_X_Mean
tBodyGyroJerk_mean_Y_Mean
tBodyGyroJerk_mean_Z_Mean
tBodyGyroJerk_std_X_Mean
tBodyGyroJerk_std_Y_Mean
tBodyGyroJerk_std_Z_Mean
tBodyAccMag_mean_Mean
tBodyAccMag_std_Mean
tGravityAccMag_mean_Mean
tGravityAccMag_std_Mean
tBodyAccJerkMag_mean_Mean
tBodyAccJerkMag_std_Mean
tBodyGyroMag_mean_Mean
tBodyGyroMag_std_Mean
tBodyGyroJerkMag_mean_Mean
tBodyGyroJerkMag_std_Mean
fBodyAcc_mean_X_Mean
fBodyAcc_mean_Y_Mean
fBodyAcc_mean_Z_Mean
fBodyAcc_std_X_Mean
fBodyAcc_std_Y_Mean
fBodyAcc_std_Z_Mean
fBodyAcc_meanFreq_X_Mean
fBodyAcc_meanFreq_Y_Mean
fBodyAcc_meanFreq_Z_Mean
fBodyAccJerk_mean_X_Mean
fBodyAccJerk_mean_Y_Mean
fBodyAccJerk_mean_Z_Mean
fBodyAccJerk_std_X_Mean
fBodyAccJerk_std_Y_Mean
fBodyAccJerk_std_Z_Mean
fBodyAccJerk_meanFreq_X_Mean
fBodyAccJerk_meanFreq_Y_Mean
fBodyAccJerk_meanFreq_Z_Mean
fBodyGyro_mean_X_Mean
fBodyGyro_mean_Y_Mean
fBodyGyro_mean_Z_Mean
fBodyGyro_std_X_Mean
fBodyGyro_std_Y_Mean
fBodyGyro_std_Z_Mean
fBodyGyro_meanFreq_X_Mean
fBodyGyro_meanFreq_Y_Mean
fBodyGyro_meanFreq_Z_Mean
fBodyAccMag_mean_Mean
fBodyAccMag_std_Mean
fBodyAccMag_meanFreq_Mean
fBodyBodyAccJerkMag_mean_Mean
fBodyBodyAccJerkMag_std_Mean
fBodyBodyAccJerkMag_meanFreq_Mean
fBodyBodyGyroMag_mean_Mean
fBodyBodyGyroMag_std_Mean
fBodyBodyGyroMag_meanFreq_Mean
fBodyBodyGyroJerkMag_mean_Mean
fBodyBodyGyroJerkMag_std_Mean
fBodyBodyGyroJerkMag_meanFreq_Mean
