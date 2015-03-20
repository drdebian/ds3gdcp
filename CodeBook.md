---
title: "CodeBook: Getdata Course Project"
author: "drdebian"
date: "March 2015"
output: html_document
---

## Data source

The input data for this project was obtained from the Human Activity Recognition Using Smartphones Data Set at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

For each record it is provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

Features are normalized and bounded within [-1,1].

Source: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.


## File usage from source

The following files were used to create "step5.txt":

1. ./features.txt (contains the variable names that were used to label the tidy dataset)
2. ./test/y_text.txt
3. ./test/X_test.txt
4. ./test/subject_test.txt
5. ./train/y_train.txt
6. ./train/X_train.txt
7. ./train/subject_train.txt

## Data processing

1. retrieve variable names from ./features.txt
2. read training data from the 3 files in the train folder, label them and combine them in one data frame (train.data)
3. same procedure as with 2., but using test folder instead (test.data)
4. combine data frames from 2. and 3. into one (full.data)
5. extract relevant variables by grepping "std" and "mean" (final.data)
6. relabel activities to be human readable (i.e. 1 -> "walking")
7. rename the original variable names to follow a human readable convention (i. e. "tBodyAcc-mean()-X" -> "TimeBodyAccelerationMeanOnXAxis")
8. summarize the data set by subject and activity, prefixing the resulting variable names with "AverageOf" (i.e. "TimeBodyAccelerationMeanOnXAxis" -> "AverageOfTimeBodyAccelerationMeanOnXAxis")
9. write the result to "step5.txt"

## Variable names transformation

original name | meaningful name
-------------------------------|-------------------------------------------------------------------
tBodyAcc-mean()-X | TimeBodyAccelerationMeanOnXAxis
tBodyAcc-mean()-Y | TimeBodyAccelerationMeanOnYAxis
tBodyAcc-mean()-Z | TimeBodyAccelerationMeanOnZAxis
tGravityAcc-mean()-X | TimeGravityAccelerationMeanOnXAxis
tGravityAcc-mean()-Y | TimeGravityAccelerationMeanOnYAxis
tGravityAcc-mean()-Z | TimeGravityAccelerationMeanOnZAxis
tBodyAccJerk-mean()-X | TimeBodyAccelerationJerkMeanOnXAxis
tBodyAccJerk-mean()-Y | TimeBodyAccelerationJerkMeanOnYAxis
tBodyAccJerk-mean()-Z | TimeBodyAccelerationJerkMeanOnZAxis
tBodyGyro-mean()-X | TimeBodyGyroscopeMeanOnXAxis
tBodyGyro-mean()-Y | TimeBodyGyroscopeMeanOnYAxis
tBodyGyro-mean()-Z | TimeBodyGyroscopeMeanOnZAxis
tBodyGyroJerk-mean()-X | TimeBodyGyroscopeJerkMeanOnXAxis
tBodyGyroJerk-mean()-Y | TimeBodyGyroscopeJerkMeanOnYAxis
tBodyGyroJerk-mean()-Z | TimeBodyGyroscopeJerkMeanOnZAxis
tBodyAccMag-mean() | TimeBodyAccelerationMagnitudeMean
tGravityAccMag-mean() | TimeGravityAccelerationMagnitudeMean
tBodyAccJerkMag-mean() | TimeBodyAccelerationJerkMagnitudeMean
tBodyGyroMag-mean() | TimeBodyGyroscopeMagnitudeMean
tBodyGyroJerkMag-mean() | TimeBodyGyroscopeJerkMagnitudeMean
fBodyAcc-mean()-X | FrequencyBodyAccelerationMeanOnXAxis
fBodyAcc-mean()-Y | FrequencyBodyAccelerationMeanOnYAxis
fBodyAcc-mean()-Z | FrequencyBodyAccelerationMeanOnZAxis
fBodyAcc-meanFreq()-X | FrequencyBodyAccelerationMeanFreqOnXAxis
fBodyAcc-meanFreq()-Y | FrequencyBodyAccelerationMeanFreqOnYAxis
fBodyAcc-meanFreq()-Z | FrequencyBodyAccelerationMeanFreqOnZAxis
fBodyAccJerk-mean()-X | FrequencyBodyAccelerationJerkMeanOnXAxis
fBodyAccJerk-mean()-Y | FrequencyBodyAccelerationJerkMeanOnYAxis
fBodyAccJerk-mean()-Z | FrequencyBodyAccelerationJerkMeanOnZAxis
fBodyAccJerk-meanFreq()-X | FrequencyBodyAccelerationJerkMeanFreqOnXAxis
fBodyAccJerk-meanFreq()-Y | FrequencyBodyAccelerationJerkMeanFreqOnYAxis
fBodyAccJerk-meanFreq()-Z | FrequencyBodyAccelerationJerkMeanFreqOnZAxis
fBodyGyro-mean()-X | FrequencyBodyGyroscopeMeanOnXAxis
fBodyGyro-mean()-Y | FrequencyBodyGyroscopeMeanOnYAxis
fBodyGyro-mean()-Z | FrequencyBodyGyroscopeMeanOnZAxis
fBodyGyro-meanFreq()-X | FrequencyBodyGyroscopeMeanFreqOnXAxis
fBodyGyro-meanFreq()-Y | FrequencyBodyGyroscopeMeanFreqOnYAxis
fBodyGyro-meanFreq()-Z | FrequencyBodyGyroscopeMeanFreqOnZAxis
fBodyAccMag-mean() | FrequencyBodyAccelerationMagnitudeMean
fBodyAccMag-meanFreq() | FrequencyBodyAccelerationMagnitudeMeanFreq
fBodyBodyAccJerkMag-mean() | FrequencyBodyAccJerkMagnitudeMean
fBodyBodyAccJerkMag-meanFreq() | FrequencyBodyAccJerkMagnitudeMeanFreq
fBodyBodyGyroMag-mean() | FrequencyBodyGyroMagnitudeMean
fBodyBodyGyroMag-meanFreq() | FrequencyBodyGyroMagnitudeMeanFreq
fBodyBodyGyroJerkMag-mean() | FrequencyBodyGyroJerkMagnitudeMean
fBodyBodyGyroJerkMag-meanFreq() | FrequencyBodyGyroJerkMagnitudeMeanFreq
angle(tBodyAccMean,gravity) | AngleTimeBodyAccelerationMeanGravity
angle(tBodyAccJerkMean),gravityMean) | AngleTimeBodyAccelerationJerkMeanGravityMean
angle(tBodyGyroMean,gravityMean) | AngleTimeBodyGyroscopeMeanGravityMean
angle(tBodyGyroJerkMean,gravityMean) | AngleTimeBodyGyroscopeJerkMeanGravityMean
angle(X,gravityMean) | AngleXGravityMean
angle(Y,gravityMean) | AngleYGravityMean
angle(Z,gravityMean) | AngleZGravityMean
tBodyAcc-std()-X | TimeBodyAccelerationStandardDeviationOnXAxis
tBodyAcc-std()-Y | TimeBodyAccelerationStandardDeviationOnYAxis
tBodyAcc-std()-Z | TimeBodyAccelerationStandardDeviationOnZAxis
tGravityAcc-std()-X | TimeGravityAccelerationStandardDeviationOnXAxis
tGravityAcc-std()-Y | TimeGravityAccelerationStandardDeviationOnYAxis
tGravityAcc-std()-Z | TimeGravityAccelerationStandardDeviationOnZAxis
tBodyAccJerk-std()-X | TimeBodyAccelerationJerkStandardDeviationOnXAxis
tBodyAccJerk-std()-Y | TimeBodyAccelerationJerkStandardDeviationOnYAxis
tBodyAccJerk-std()-Z | TimeBodyAccelerationJerkStandardDeviationOnZAxis
tBodyGyro-std()-X | TimeBodyGyroscopeStandardDeviationOnXAxis
tBodyGyro-std()-Y | TimeBodyGyroscopeStandardDeviationOnYAxis
tBodyGyro-std()-Z | TimeBodyGyroscopeStandardDeviationOnZAxis
tBodyGyroJerk-std()-X | TimeBodyGyroscopeJerkStandardDeviationOnXAxis
tBodyGyroJerk-std()-Y | TimeBodyGyroscopeJerkStandardDeviationOnYAxis
tBodyGyroJerk-std()-Z | TimeBodyGyroscopeJerkStandardDeviationOnZAxis
tBodyAccMag-std() | TimeBodyAccelerationMagnitudeStandardDeviation
tGravityAccMag-std() | TimeGravityAccelerationMagnitudeStandardDeviation
tBodyAccJerkMag-std() | TimeBodyAccelerationJerkMagnitudeStandardDeviation
tBodyGyroMag-std() | TimeBodyGyroscopeMagnitudeStandardDeviation
tBodyGyroJerkMag-std() | TimeBodyGyroscopeJerkMagnitudeStandardDeviation
fBodyAcc-std()-X | FrequencyBodyAccelerationStandardDeviationOnXAxis
fBodyAcc-std()-Y | FrequencyBodyAccelerationStandardDeviationOnYAxis
fBodyAcc-std()-Z | FrequencyBodyAccelerationStandardDeviationOnZAxis
fBodyAccJerk-std()-X | FrequencyBodyAccelerationJerkStandardDeviationOnXAxis
fBodyAccJerk-std()-Y | FrequencyBodyAccelerationJerkStandardDeviationOnYAxis
fBodyAccJerk-std()-Z | FrequencyBodyAccelerationJerkStandardDeviationOnZAxis
fBodyGyro-std()-X | FrequencyBodyGyroscopeStandardDeviationOnXAxis
fBodyGyro-std()-Y | FrequencyBodyGyroscopeStandardDeviationOnYAxis
fBodyGyro-std()-Z | FrequencyBodyGyroscopeStandardDeviationOnZAxis
fBodyAccMag-std() | FrequencyBodyAccelerationMagnitudeStandardDeviation
fBodyBodyAccJerkMag-std() | FrequencyBodyAccJerkMagnitudeStandardDeviation
fBodyBodyGyroMag-std() | FrequencyBodyGyroMagnitudeStandardDeviation
fBodyBodyGyroJerkMag-std() | FrequencyBodyGyroJerkMagnitudeStandardDeviation

Note: For the final file "step5.txt" an additional prefix "AverageOf" was added to the meaningful variable name to indicate the summarized nature of the data.

## Data dictionary

* subject: integers from 1 to 30 indication the individual the data was recorded from, aged 19 - 48.
* activity: one of six activities of daily living
    + walking
    + walking upstairs
    + walking downstairs
    + sitting
    + standing
    + laying
* variables: tidy set of all mean and standard deviation measurements for each subject and activity

