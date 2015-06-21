#Class Project Class 3
Switch to the project folder
setwd("~/C3Proj")


#import  a dataframe of variable names for  column names.  Use underscore rathern than hyphens
features <- "./UCI HAR Dataset/features.txt"
dtColumns <- read.table(features)
dtColumns[,2] <- gsub("-", "_", dtColumns[,2])  
dtColumns[,2] <- gsub("()", "", dtColumns[,2], fixed=TRUE)

#Pull in the Train  subjects, and then the activity data
subject1 <- "./UCI HAR Dataset/train/subject_train.txt"
dtSubject1 <- read.table(subject1,  col.names = c("SubjectID"  ))

#Also the Train Activities
activity1 <- "./UCI HAR Dataset/train/y_train.txt"
dtActivity1  <- read.table(activity1, col.names = c("ActivityID" ))
 
#Read the Training dataset and apply the variable names from the features.txt file
fil1 <- "./UCI HAR Dataset/train/X_train.txt"
dtSubAct1 <- read.table(fil1, colClasses="numeric"  , col.names = dtColumns[,2] )

#Prepend colums with the users and their activities
dtSubAct1 <- cbind(dtSubject1, dtActivity1, dtSubAct1)


#Do the same for the TEST datasets 
#Pull in the TEST  subjects, and then the activity data
subject2 <- "./UCI HAR Dataset/test/subject_test.txt"
dtSubject2 <- read.table(subject2,  col.names = c("SubjectID"  ))

#Also the TEST Activities
activity2 <- "./UCI HAR Dataset/test/y_test.txt"
dtActivity2 <- read.table(activity2, col.names = c("ActivityID" ))

#Read the TEST dataset and apply the variable names from the features.txt file
fil2 <- "./UCI HAR Dataset/test/X_test.txt"
dtSubAct2 <- read.table(fil2, colClasses="numeric"  , col.names = dtColumns[,2] )

#Prepend colums with the users and their activities
dtSubAct2 <- cbind(dtSubject2, dtActivity2, dtSubAct2)



#Merge the two datasets 
dtSubAct <- rbind(dtSubAct1, dtSubAct2)
#View(dtSubAct)

#Build a logical vector if the variable names nention mean() or std()
logSubCols <- grepl('ActivityID|SubjectID|mean|std', labels(dtSubAct)[[2]])
dtSubset <- dtSubAct[logSubCols]



#Calculate the mean of each variable, grouping down to by-user and by-activity, and omitting the computed GROUP cols
tidyActivities <-aggregate(dtSubset, by=list(dtSubset$SubjectID, dtSubset$ActivityID), FUN=mean, na.rm=TRUE)
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


#View(tidyActivities)

#Output a csv file
outfile <- "~/C3Proj/TidyData/SubjectActivites.csv"
write.csv(tidyActivities[,3:ncol(tidyActivities)], file = outfile, row.names=FALSE)
summary(outfile) 


