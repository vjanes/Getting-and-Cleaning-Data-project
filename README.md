Getting-and-Cleaning-Data-project
=================================

###Assignment
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected. 

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

 You should create one R script called run_analysis.R that does the following. 

    Merges the training and the test sets to create one data set.
    Extracts only the measurements on the mean and standard deviation for each measurement. 
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive variable names. 

    From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Good luck!


###Method

I did the assignment following proposed method.

#####Getting started
I imported original data using read.csv function.
I reformated data to safeguard origin file and line placement in two rows ("line" and "sample") for relevant data.

#####PART1: Merging files
Line position and file origin having been safeguarded I was able to easily concatenate "Xtest" and "Xtrain" using rbind function in "X_all" df.

#####PART2: Selecting mean and sd measurement
I elected to select all measurements having "mean()" and "sd()" string in their label, notably excluding meanFreq measurements.
I selected those measurements using the grep function. Those measurements where saved in the "red-feature" dataframe.
From this df I was able to create a "red-feat-cols" list that I used to select cols in "X_all" df.

#####PART3: Labelling activities
Labelling activities was done by a simple merge between X_all and the activity table.

#####PART4: Labelling variables
Labelling variables was done by pushing "red-feature" labels in colnames(X_all).
At this point tidy data was in X-all, copied in "tidy1" for clarity.

#####PART5: Aggregating.
Aggregating was done as required "for each activity and each subject".
I considered aggregating by activity*subject couples (which could have be done using by=list(... ), which seemed "tidier" to me, but this wasn't the exact assignment.
Result data is mixed in a single df/file as per assignment, which is quite untidy.
Grouping data is in group column. If data is numeric grouping is per subject (number being subject id), if data is text, grouping is per activity.

#####Note
I included text file tidy.txt in the github repository, just in case.

