# **Getting-and-Cleaning-Data-Course-Project**

## **Initial data for research**

This script was write to analyze the data from [UCI HAR DataSet](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). It's supposed that archive is extracted 
to the working directory.

The following files from the initial dataset is used:

1. _**features.txt:**_ this file include the descriptions for features measured
2. _**train/X_train.txt:**_ this file include the measurements of the features in train set (one row - 1 measurement of 561 features)
3. _**test/X_test.txt:**_ this file include the measurements of the features in test set
4. _**train/subject_train.txt:**_ this file include the subject for each measurement from the train set
5. _**test/subject_test.txt:**_ this file include the subject for each measurement from the test set
6. _**train/y_train.txt:**_ this file include the activity (from 1 to 6) for each measurement from the train set
7. _**test/y_test.txt:**_ this file include the activity (from 1 to 6) for each measurement from the test set

## **Content Files**


* [`CodeBook.md`](https://github.com/xyzdiego/Getting-and-Cleaning-Data-Course-Project/blob/master/CodeBook.md) This is a file that describes the variables, the data, and any transformations or work that I performed to clean up the data
* [`run_analysis.r`](https://github.com/xyzdiego/Getting-and-Cleaning-Data-Course-Project/blob/master/run_analysis.R) This is a script that performs the data preparation and then followed by the 5 steps required as described in the course project’s definition:
	* Merges the training and the test sets to create one data set.
	* Extracts only the measurements on the mean and standard deviation for each measurement.
	* Uses descriptive activity names to name the activities in the data set
	* Appropriately labels the data set with descriptive variable names.
	* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* [`TidyData.txt`](https://github.com/xyzdiego/Getting-and-Cleaning-Data-Course-Project/blob/master/TidyData.txt) This is the final file with the exported final data after going through all the sequences described above.
