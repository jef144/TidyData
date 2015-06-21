# TidyData
Class 3 of Data Science series

This project uses a source dataset described here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The actual data,  downloaded 2015-06-19,  is here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The data is distributed between two sets of files,  Test and Train.  The description makes clear that these were derived from a single experimenal protocol,  so it is admissable to simply concatenate the two datasets.  They contain the same 561 variables in the same sequence.  

Evidently because the data are intended for use in a machine learning project,  the identities of the subjects (persons) are in separate files(subject_test.txt)  from the observed variables.   The experimental activies are also listed in a sepeate dataset (y_test.txt).  These category fields are easily associated with the observation dataset using cbind.  It is necessary to perform this associatio separately for the Test and the Train data.    It is important that the original sort order is preseved until the cbind operation is completed.

Not all of the 561 observations are required to build the Tidy data requested.  Only observations that inlcude 'mean'  and 'standard deviations'  are to be included.  To narrow down the 561 variables to the desired types we apply a pattern match (regular expression)  to the original variable name,  which are sourced from a file called features.txt.   Some character substitutions were applied to these names to generate R-compliant names -- underscores were substituted for hyphens and parenthesis.  

Finally, an aggregate function was applied to the combined Test and Train data.  Each output observation applies to one subject, one activity, and the numeric values are the Mean of the input variables (which, in turn,  were means and standard deviations of many observations)


 
