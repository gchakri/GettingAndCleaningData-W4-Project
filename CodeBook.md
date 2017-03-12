

# Getting and Cleaning Data - Week 4 Class Project
The over all goal of this project is to aggregate the data listed in many text files into a meaningful format and from extract a finaly tiday data that will be useful for further future analysis. Project indicates what variables need to be extracted and aggregated in detail, which we will discuss below. 

### Some of the key variables used in this analysis are:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

 


To understand labels and data, please read **FEATURE_INFO.TXT** from your "data\UCI HAR Dataset" folder. Here are some oAs a result of 

## **Key data variable and methods** used in this Script/Analysis are:

* **dfList** - This is a list object that loads all data sets (.txt files downloaded). This list object contains 26 dataframes, one for each of the TXT file (except README.TXT and FEATURES_INFO.TXT)
* **data.files** - This contains all files names with the path, enabling a looped function to read them
* **myNames** - This contains an array of file names after removing .txt. This is used as **name** of each data frame in the lis **dfList**.
* **featureMeansStd** - This logical vecor is used to extract all X variables that represent mean and Std of some observations
* **dfTest, dfTrain** - These are processed test and training data sets with all relevant variables in them
* **combData** - This is combined data from **dfTest, dfTrain**.
* **tidyDataFinal** - This is the finally tidied up data as per the instructions.
* The final output TXT file named **Final_Project_Output.txt** will be in the working folder, after running the run_analysis.R file in your R IDE.

### Finally here is teh description of some of the variables in submitted final tidy data set  (**Final_Project_Output.txt**):

* **SubjectID** - Participant code that was used in this study
* **Activity** - Description of the activity that is measured
* **various measures listed below** - these are means (of each subject for each activity level) of **time domain signals** and **frequency domain signals** that based on various sensor measure

"tBodyAcc-mean()-X"     "tBodyAcc-mean()-Y"     "tBodyAcc-mean()-Z" 
"tBodyAcc-std()-X"      "tBodyAcc-std()-Y"      "tBodyAcc-std()-Z" 
"tGravityAcc-mean()-X"  "tGravityAcc-mean()-Y"  "tGravityAcc-mean()-Z" 
"tGravityAcc-std()-X"   "tGravityAcc-std()-Y"   "tGravityAcc-std()-Z" 
"tBodyAccJerk-mean()-X" "tBodyAccJerk-mean()-Y" "tBodyAccJerk-mean()-Z" 
"tBodyAccJerk-std()-X"  "tBodyAccJerk-std()-Y"  "tBodyAccJerk-std()-Z" 
"tBodyGyro-mean()-X"    "tBodyGyro-mean()-Y"    "tBodyGyro-mean()-Z" 
"tBodyGyro-std()-X"     "tBodyGyro-std()-Y"     "tBodyGyro-std()-Z" 
"tBodyGyroJerk-mean()-X" "tBodyGyroJerk-mean()-Y" "tBodyGyroJerk-mean()-Z" 
"tBodyGyroJerk-std()-X" "tBodyGyroJerk-std()-Y" "tBodyGyroJerk-std()-Z" 
"tBodyAccMag-mean()"    "tBodyAccMag-std()"     "tGravityAccMag-mean()" 
"tGravityAccMag-std()"  "tBodyAccJerkMag-mean()" "tBodyAccJerkMag-std()" 
"tBodyGyroMag-mean()"   "tBodyGyroMag-std()"    "tBodyGyroJerkMag-mean()" 
"tBodyGyroJerkMag-std()" "fBodyAcc-mean()-X"    "fBodyAcc-mean()-Y" 
"fBodyAcc-mean()-Z"     "fBodyAcc-std()-X"      "fBodyAcc-std()-Y" 
"fBodyAcc-std()-Z"      "fBodyAcc-meanFreq()-X" "fBodyAcc-meanFreq()-Y" 
"fBodyAcc-meanFreq()-Z" "fBodyAccJerk-mean()-X" "fBodyAccJerk-mean()-Y" 
"fBodyAccJerk-mean()-Z" "fBodyAccJerk-std()-X"  "fBodyAccJerk-std()-Y" 
"fBodyAccJerk-std()-Z"  "fBodyAccJerk-meanFreq()-X" "fBodyAccJerk-meanFreq()-Y" 
"fBodyAccJerk-meanFreq()-Z" "fBodyGyro-mean()-X" "fBodyGyro-mean()-Y" 
"fBodyGyro-mean()-Z"    "fBodyGyro-std()-X"     "fBodyGyro-std()-Y" 
"fBodyGyro-std()-Z"     "fBodyGyro-meanFreq()-X" "fBodyGyro-meanFreq()-Y" 
"fBodyGyro-meanFreq()-Z" "fBodyAccMag-mean()"               "fBodyAccMag-std()" 
"fBodyAccMag-meanFreq()" "fBodyBodyAccJerkMag-mean()"       "fBodyBodyAccJerkMag-std()" 
"fBodyBodyAccJerkMag-meanFreq()" "fBodyBodyGyroMag-mean()"  "fBodyBodyGyroMag-std()" 
"fBodyBodyGyroMag-meanFreq()" "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()"
"fBodyBodyGyroJerkMag-meanFreq()"


