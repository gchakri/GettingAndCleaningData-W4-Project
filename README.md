


#Getting and Cleaning Data Course Projectless 
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


Good luck!

---------------------------------------------------

## How these scripts work and how to reproduce the project:

* This Repo doesn't contain the data, and the script will help you download
* Chose a working directory of your choice
* Ensure that you either don't have a subfolder called "data" or if it is, it is empty of any .txt files in it and in its subfolders.
* Now open run_analysis.r from this repo in your R IDE. 
* Copy all lines in that .r file to R console. Alternatively you can source the r file using "source("run_analysis.R")".
* The script contains logic to download, process the data as per the instructions and outputs

## Project Output
As a result of this script, you will see the following:

* Source zip file in a subfolder of your working directory named "data".
* Unzipped text files in "data\UCI HAR Data set"" and its subfolders
* Final Data data file named "Final_Project_Output.txt". This file contains 180 rows of data (for 30 subjects and 6 activity levels)

------------------------------------------------------
