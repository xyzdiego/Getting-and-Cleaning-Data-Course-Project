###########################################################
### This is a Getting and Cleaning Data Course Project  ###
### This work was elabrated by Diego Andres Benitez     ###
###########################################################

## Loading packages
library(dplyr)

## Download dataset
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, "./Coursera_DS3_Final.zip", method="curl")

## unzip dataset
unzip("./Coursera_DS3_Final.zip")

# Assigning the data.frame individual variables
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

# Merge the data
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
MergedData <- cbind(Subject, X, Y)

# Extracted only the mean and sd for each measurement
TidyDataSet <- MergedData %>% select(subject, code, contains("mean"), contains("std"))
TidyDataSet$code <- activities[TidyDataSet$code, 2]

# Change for the appropiate labels
names(TidyDataSet)[2] = "activity"
names(TidyDataSet)<-gsub("Acc", "Accelerometer", names(TidyDataSet))
names(TidyDataSet)<-gsub("Gyro", "Gyroscope", names(TidyDataSet))
names(TidyDataSet)<-gsub("BodyBody", "Body", names(TidyDataSet))
names(TidyDataSet)<-gsub("Mag", "Magnitude", names(TidyDataSet))
names(TidyDataSet)<-gsub("^t", "Time", names(TidyDataSet))
names(TidyDataSet)<-gsub("^f", "Frequency", names(TidyDataSet))
names(TidyDataSet)<-gsub("tBody", "TimeBody", names(TidyDataSet))
names(TidyDataSet)<-gsub("-mean()", "Mean", names(TidyDataSet), ignore.case = T)
names(TidyDataSet)<-gsub("-std()", "SD", names(TidyDataSet), ignore.case = T)
names(TidyDataSet)<-gsub("-freq()", "Frequency", names(TidyDataSet), ignore.case = T)
names(TidyDataSet)<-gsub("angle", "Angle", names(TidyDataSet))
names(TidyDataSet)<-gsub("gravity", "Gravity", names(TidyDataSet))

TidyData <- TidyDataSet %>% group_by(subject, activity) %>% summarise_all(funs(mean))
write.table(TidyData, "TidyData.txt", row.name=FALSE)