CodeBook
==========================================

Data source
-----------
The dataset used was [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


Data Set Information
-----------
(from the original website)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


Section 1. Merge the training and the test sets to create one data set.
-----------
Read into tables the data located in
- features.txt
- activity_labels.txt
- subject_train.txt
- x_train.txt
- y_train.txt
- subject_test.txt
- x_test.txt
- y_test.txt

Assigned column names and merge to create one data set "all_data".

Section 2. Extract only the measurements on the mean and standard deviation for each measurement. 
-----------
Select only column names that are activityId,subjectId and has "mean" or "std" in the column names

Section 3. Use descriptive activity names to name the activities in the data set
-----------
Merged data with activity Type data get the descriptive activity names

Section 4. Appropriately label the data set with descriptive activity names.
-----------
Removed colujmn activityId
Used gsub function to replace some column short forms with full form

Section 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
-----------
Grouped the data by activity name and subject, cand took mean of all the other columns
Results are saved to the file "tidy.txt"