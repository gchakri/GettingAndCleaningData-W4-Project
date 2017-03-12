

# Getting and Cleaning Data - Week 4 Class Project
The over all goal of this project is to aggregate the data listed in many text files into a meaningful format and from extract a finaly tiday data that will be useful for further future analysis. Project indicates what variables need to be extracted and aggregated in detail, which we will discuss below. 

To work successfully with this script, we need to load the following packages first.
```
library(data.table)
library(dplyr)
library(reshape2)
```

## **Key variables** used in this Script/Analysis

* **dfList** - This is a list object that loads all data sets (.txt files downloaded). This list object contains 26 dataframes, one for each of the TXT file (except README.TXT and FEATURES_INFO.TXT)
* **data.files** - This contains all files names with the path, enabling a looped function to read them
* **myNames** - This contains an array of file names after removing .txt. This is used as **name** of each data frame in the lis **dfList**.
* **featureMeansStd** - This logical vecor is used to extract all X variables that represent mean and Std of some observations
* **dfTest, dfTrain** - These are processed test and training data sets with all relevant variables in them
* **combData** - This is combined data from **dfTest, dfTrain**.
* **tidyDataFinal** - This is the finally tidied up data as per the instructions.

**NOTES**: 

1. To understand labels and data in the original downloaded data, please read FEATURE_INFO.TXT from your "data\UCI HAR Dataset" folder
2. The final output TXT file named **Final_Project_Output.txt** will be in the working folder, after running the run_analysis.R file in your R IDE.

## More details on data processing and transormation

Following section of the code will download the ZIP file into a subfolder "data" in working directory. First we will check if the subfolder "data" exists and if not we will create. It is important that this "data" subfolder in your current working directory is clean and empty, particulalry with no other .txt files. For processing the data neatly, I am temporarily moving working directory to this "data" subfolder. Download the zip file and unzip it to get all files in it.
```
if(!file.exists("./data")){
    dir.create("./data")
}
oldPath <- getwd()
newPath <- newpath <- paste(oldPath, "data", sep="/")
setwd(newPath)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./DataToClean.zip")
unzip("DataToClean.zip")
```

Now that we donloaded and unzipped files from the project site, let's read all relevant text files into R environment. I did this by listing and storing all files extracted from ZIP file. From this list i remember two files to exclude README.TXT and FEATUES_INFO.TXT (3rd and 4th files in the list). In the next step, I extracted file names using file_path_sans_ext function from **tools** library. Then I created a list of data frames by reading all 26 files in the ZIP file - with a hope to explore them and transform the way project asked. 

Foreach dataframe in the list, I assigned names using **myNames** so that we can call them out easily. Finally, I set the working folder back to the previous user choice folder.
```
library(tools) ## we need this for file_path_sans_ext
data.files <- list.files(pattern = ".txt$", recursive = TRUE)
data.files <- data.files[-3:-4] ## this is to remove readme and features_info
myNames <- basename(file_path_sans_ext(data.files))
dfList<-list()
for (i in 1:length(data.files)){
	dfList[[i]]<-read.table(data.files[i])
}
names(dfList)<- myNames
setwd(oldPath)
```


### STEP 3. Uses descriptive activity names to name the activities in the data set.
**$y_test** dataframe in dfList contains the activity codes with a numeric value between 1 and 6 indicating various types of activities. **$activity_labels** in dfList contains the labels with first column as number and second column with descriptive label. To make the data better readable I am replacing y_test data with corresponding label. Similalry for the traininf (y_train) data too in the dfList.
```
dfList$y_test[,1] <- dfList$activity_labels[,2][dfList$y_test[,1]]
dfList$y_train[,1] <- dfList$activity_labels[,2][dfList$y_train[,1]]
```

### STEP 4. Appropriately labels the data set with descriptive variable names.
The following code assigns proper variable (column) names all measurement variables (X_test and X_train) using **features** data frame second column in the dfList. These 561 label names will be assigned to 561 measurements in X. Similalry activity and the particpants column are also added with column names (for both test and train data sets).
```
names(dfList$X_test) <- dfList$features[,2]
names(dfList$y_test) <- "Activity"
names(dfList$subject_test) <- "SubjectID"

names(dfList$X_train) <- dfList$features[,2]
names(dfList$y_train) <- "Activity"
names(dfList$subject_train) <- "SubjectID"
```

### STEP 2. As instructed, reduce X-data only with the mean & std for each measurement.
As we saw there are 561 X observations in the original data. Project instructs us to extract only mean and std measurements only, so the following code first creates a logical vector to identify column names of X data in both test and train data sets contains "mean and std" in them" and reducecs the data just to them. This works so, as the column headers are 516 in each data sets and share the same column names. 
```
featuresMeanStd <- grepl("mean|std", dfList$features[,2])
dfList$X_test = dfList$X_test[,featuresMeanStd]
dfList$X_train = dfList$X_train[,featuresMeanStd]
```

### STEP 1. Merges the training and the test sets to create one data set.
The following code now combines for test and tran, individually, SubjectID, Activity and reduced X data, to form a new data frames. From these two data frames we will rbind to create combined data frame with entre data.
```
dfTest <- cbind(dfList$subject_test, dfList$y_test, dfList$X_test)
dfTrain <- cbind(dfList$subject_train, dfList$y_train, dfList$X_train)
combData <- rbind(dfTest, dfTrain)
```

### STEP 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
To meet this goal, I first converted the SubjectID as a factor which was a numeric type before. Then using reshape2 package functions, I melted data using SubjectID and Activity with rest all as variables. Then using "decast" function, I aggregated all variabes with mean function, so that each row of the data represents "for a subject and for an activity the mean data of all observations". Since we have 30 subjects and 6 activities, there will be 180 rows of data of means of all mean and std deviation data.
```
combData$SubjectID <- as.factor(combData$SubjectID)
meltData <- melt(combData, id=c("SubjectID", "Activity"))
tidyDataFinal <- dcast(meltData, SubjectID + Activity ~ variable, mean)
```

### Finally we will write out the tidy data for project submission along with GitHub repo
```
write.table(tidyDataFinal, file = "./Final_Project_Output.txt", row.name=FALSE)
```

## END OF THE PROJECT
