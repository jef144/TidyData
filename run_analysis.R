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

#Calculate the mean of each variable, grouping down to by-user and by-activity, and omitting the computed GROUP cols
tidyActivities <-aggregate(dtSub1, by=list(dtSub1$SubjectID, dtSub1$ActivityID), FUN=mean, na.rm=TRUE)
#Ditch the computed GROUP.x colsd GROUP cols
summary(tidyActivities)

#Substitute the Activty names in place of the Activity IDs. 
tidyActivities$ActivityID  <- gsub("1","WALKING",tidyActivities$ActivityID)
tidyActivities$ActivityID  <- gsub("2","WALKING_UPSTAIRS",tidyActivities$ActivityID)
tidyActivities$ActivityID  <- gsub("3","WALKING_DOWNSTAIRS",tidyActivities$ActivityID)
tidyActivities$ActivityID  <- gsub("4","SITTING",tidyActivities$ActivityID)
tidyActivities$ActivityID  <- gsub("5","STANDING",tidyActivities$ActivityID)
tidyActivities$ActivityID  <- gsub("6","LAYING",tidyActivities$ActivityID)

#Make it clear that these are averages of the original variables -- add _Mean as suffix
colnames(tidyActivities)[5:ncol(tidyActivities)] <- paste(  colnames(tidyActivities)[5:ncol(tidyActivities)], "Mean", sep = "_")


View(tidyActivities)

 

 


#Read the Test dataset

 
#Merge the two datasets 
