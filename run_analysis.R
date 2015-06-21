#Class Project

setwd("~/C3Proj")


#import  a dataframe of variable names for  column names
features <- "./UCI HAR Dataset/features.txt"
dtColumns <- read.table(features)
  

#Pull in the subjects, and then the activity data
subject <- "./UCI HAR Dataset/train/subject_train.txt"
dtSubject <- read.table(subject,  col.names = c("SubjectID"  ))

#Also the Activities
activity<- "./UCI HAR Dataset/train/y_train.txt"
dtActivity <- read.table(activity, col.names = c("ActivityID" ))


#Read the Training dataset and apply the variable names from the features.txt file
fil <- "./UCI HAR Dataset/train/X_train.txt"
dtTrain <- read.table(fil, colClasses="numeric"  , col.names = dtColumns[,2] )

#Build a logical vector if the variable names nention mean() or std()
logSub <- grepl('mean()|std()', labels(dtTrain)[[2]])
dtSub <- dtTrain[logSub]

#Prepend colums with the users and their activities
dtSub1 <- cbind(dtSubject, dtActivity, dtSub)

labels(dtSub1)
View(dtSub1)



#Substitute the Activty names in place of the Activity IDs
 

 


#Read the Test dataset

 
#Merge the two datasets 
