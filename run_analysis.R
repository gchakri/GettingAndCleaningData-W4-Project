## Getting and Cleaning Data - Week 4 Class Project
## To work successfully, this script requires the following packages
library(data.table)
library(dplyr)
library(reshape2)

## Let's download the ZIP file into a subfolder "data" in working directory
if(!file.exists("./data")){
    dir.create("./data")
}
oldPath <- getwd()
newPath <- newpath <- paste(oldPath, "data", sep="/")
setwd(newPath)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./DataToClean.zip")
unzip("DataToClean.zip")

## Now read this data set and load into R environment
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

## STEP 3. Uses descriptive activity names to name the activities in the
##         data set.
dfList$y_test[,1] <- dfList$activity_labels[,2][dfList$y_test[,1]]
dfList$y_train[,1] <- dfList$activity_labels[,2][dfList$y_train[,1]]

## STEP 4. Appropriately labels the data set with descriptive variable names.
names(dfList$X_test) <- dfList$features[,2]
names(dfList$y_test) <- "Activity"
names(dfList$subject_test) <- "SubjectID"

names(dfList$X_train) <- dfList$features[,2]
names(dfList$y_train) <- "Activity"
names(dfList$subject_train) <- "SubjectID"

## STEP 2. As instructed, reduce X-data only with the mean & std 
##         for each measurement.

featuresMeanStd <- grepl("mean|std", dfList$features[,2])
dfList$X_test = dfList$X_test[,featuresMeanStd]
dfList$X_train = dfList$X_train[,featuresMeanStd]

## STEP 1. Merges the training and the test sets to create one data set.
dfTest <- cbind(dfList$subject_test, dfList$y_test, dfList$X_test)
dfTrain <- cbind(dfList$subject_train, dfList$y_train, dfList$X_train)
combData <- rbind(dfTest, dfTrain)

## STEP 5. From the data set in step 4, creates a second, independent tidy
##         data set with the average of each variable for each activity and
##         each subject.

combData$SubjectID <- as.factor(combData$SubjectID)
meltData <- melt(combData, id=c("SubjectID", "Activity"))
tidyDataFinal <- dcast(meltData, SubjectID + Activity ~ variable, mean)

write.table(tidyDataFinal, file = "./Final_Project_Output.txt", row.name=FALSE)

## END OF THE PROJECT
