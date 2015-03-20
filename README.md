---
title: "README: GetData Course Project"
author: "drdebian"
date: "March 2015"
output: html_document
---

## Usage

$ R --vanilla < run_analysis.R


## What does the script do?

The R script called run_analysis.R in this repository does the following:

1. It merges the training and the test sets found in the folder "UCI HAR Dataset" to create one data set.
2. It extracts only the measurements on the mean and standard deviation for each measurement. 
3. It uses descriptive activity names to name the activities in the data set.
4. It appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, it creates a second, independent tidy data set with the average of each variable for each activity and each subject, which is written to 
"step5.txt" in the working directory.

## What does the script need in order to run?

* R (Version 3.1.2 or greater)
* Packages: dplyr, reshape2
* the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip unzipped to the folder "UCI HAR Dataset" in your working directory
* Run run_analysis.R form your R console

## What data is being used as input?

Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

Source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## What data is being produced as output?

The script produces a summary of the tidy data, written to "step5.txt" in the working directory. For further information, refer to CodeBook.md in this repository.

