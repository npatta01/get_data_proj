Getting and Cleaning Data - Course Project
==========================================

This repository hosts the my submission for the Data Science's track course "Getting and Cleaning data", available in coursera.

The dataset used was [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


About the raw data
------------------

The features (561 of them) are unlabeled and can be found in the x_test.txt. 
The activity labels are in the y_test.txt file.
The test subjects are in the subject_test.txt file.

The same holds for the training set.

Files
------------------
The repo contains a copy of the data in the folder "UCI_HAR_Dataset"

`CodeBook.md` describes the variables, the data, and any transformations or work that was performed to clean up the data.

`run_analysis.R` contains all the code to perform the analyses described in the 5 steps. They can be launched in RStudio by just importing the file.

The output of the processing is called `tidy.txt`, and uploaded in the course project's form.