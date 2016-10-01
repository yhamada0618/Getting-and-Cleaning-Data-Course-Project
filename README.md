# Getting-and-Cleaning-Data-Course-Project

This script "run_analysis.R" is to manipulate the follwing data set: 

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit? degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

Detailed information on this original dataset is found below:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


The script does the follwing functions.

1. To merges the training and the test sets to create one data set
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Labels the activities in the data set using descriptive activity names.
4. Appropriately labels the variables with descriptive names.

The resulting data set is named "test_train"

Subsequently,the script creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The data set created is named "second_data"


Codebook is available summarizing the variables in the data sets.
