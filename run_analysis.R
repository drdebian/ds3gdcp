###
# Getting and Cleaning Data Course Project
###

# Data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# Copy of data assumed to be stored in "./UCI HAR Dataset"
###


#####
#
# Step 0: Init
#
#####


# set up libraries
###
library(dplyr, reshape2)

# set up paths
###
my.wd  <- getwd()
my.fd  <- file.path(my.wd, "UCI HAR Dataset")


#####
#
# Step 1: Merge the training and the test sets to create one data set
#
#####


# retrieve variable names from the features.txt file into varnames
###
varnames <- read.table(file.path(my.fd, "features.txt"))[,2]

# load training data set files
###
x.train <- read.table(file.path(my.fd, "train", "X_train.txt"))
colnames(x.train)  <- varnames
act.train <- read.table(file.path(my.fd, "train", "y_train.txt"), col.names = c("activity"))
sub.train <- read.table(file.path(my.fd, "train", "subject_train.txt"), col.names = c("subject"))
#
# put the .train parts together
###
train.data <- cbind(sub.train, act.train, x.train)


# load test data set files
###
x.test <- read.table(file.path(my.fd, "test", "X_test.txt"))
colnames(x.test)  <- varnames
act.test <- read.table(file.path(my.fd, "test", "y_test.txt"), col.names = c("activity"))
sub.test <- read.table(file.path(my.fd, "test", "subject_test.txt"), col.names = c("subject"))
#
# put the .test parts together
###
test.data <- cbind(sub.test, act.test, x.test)

#
# recombine test and training data into a full set
###
full.data <- rbind(test.data, train.data)


#####
#
# Step 2: Extract only the measurements on the mean and standard deviation for each measurement
#
#####


#
# put together column list for final table containing only subject, activity, means and stds
###
std.cols <- agrep("std", colnames(full.data), ignore.case = TRUE, value = TRUE)
mean.cols <- agrep("mean", colnames(full.data), ignore.case = TRUE, value = TRUE)
final.cols <- c("subject", "activity", mean.cols, std.cols)
final.data  <- full.data[,final.cols]


#####
#
# Step 3: Use descriptive activity names to name the activities in the data set
#
#####


final.data[,2] <- sub("1", "walking", final.data[,2])
final.data[,2] <- sub("2", "walking upstairs", final.data[,2])
final.data[,2] <- sub("3", "walking downstairs", final.data[,2])
final.data[,2] <- sub("4", "sitting", final.data[,2])
final.data[,2] <- sub("5", "standing", final.data[,2])
final.data[,2] <- sub("6", "laying", final.data[,2])


#####
#
# Step 4: Appropriately label the data set with descriptive variable names
#
#####


names(final.data)  <- make.names(names(final.data))
names(final.data)  <- gsub("tBodyAcc", "TimeBodyAcceleration", names(final.data), fixed = TRUE)
names(final.data)  <- gsub("tGravityAcc", "TimeGravityAcceleration", names(final.data), fixed = TRUE)
names(final.data)  <- gsub("tBodyGyro", "TimeBodyGyroscope", names(final.data), fixed = TRUE)
names(final.data)  <- gsub(".std", "StandardDeviation", names(final.data), fixed = TRUE)
names(final.data)  <- gsub("...X", "OnXAxis", names(final.data), fixed = TRUE)
names(final.data)  <- gsub("...Y", "OnYAxis", names(final.data), fixed = TRUE)
names(final.data)  <- gsub("...Z", "OnZAxis", names(final.data), fixed = TRUE)
names(final.data)  <- gsub("Mag", "Magnitude", names(final.data), fixed = TRUE)
names(final.data)  <- gsub("fBodyAcc", "FrequencyBodyAcceleration", names(final.data), fixed = TRUE)
names(final.data)  <- gsub("fBodyGyro", "FrequencyBodyGyroscope", names(final.data), fixed = TRUE)
names(final.data)  <- gsub(".mean", "Mean", names(final.data), fixed = TRUE)
names(final.data)  <- gsub("fBodyBody", "FrequencyBody", names(final.data), fixed = TRUE)
names(final.data)  <- gsub("angle.", "Angle", names(final.data), fixed = TRUE)
names(final.data)  <- gsub("angOnXAxis.", "AngleOnXAxis", names(final.data), fixed = TRUE)
names(final.data)  <- gsub("angOnYAxis.", "AngleOnYAxis", names(final.data), fixed = TRUE)
names(final.data)  <- gsub("angOnZAxis.", "AngleOnZAxis", names(final.data), fixed = TRUE)
names(final.data)  <- gsub("Mean.", "Mean", names(final.data), fixed = TRUE)
names(final.data)  <- gsub("gravity", "Gravity", names(final.data), fixed = TRUE)
names(final.data)  <- gsub(".", "", names(final.data), fixed = TRUE)



#####
#
# Step 5: From the data set in step 4, create a second, independent tidy data set 
#         with the average of each variable for each activity and each subject
#
#####


#
# group the data by subject and activity, get the means and fix the column names
###
grouped.data  <- group_by(final.data, subject, activity)
measures  <- names(final.data[3:88])
summarized.data <- summarise_each(grouped.data, funs(mean), 3:88)
names(summarized.data)[3:88]  <- paste0("AverageOf", names(summarized.data)[3:88])

#
# write the tidy data set of means to a textfile
###
write.table(summarized.data, file = "step5.txt", row.name=FALSE)

