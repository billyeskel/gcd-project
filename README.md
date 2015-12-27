# How the Code Works 
* This is for the __**run_analysis.R code**__ for the Course project for Coursera Johns Hopkins Getting and Cleaning Data course
* Click on this link [run_analysis.R code](./run_analysis.R) for the code itself 

# Key data for the code
* The data is the Samsung Data (aka University of California at Irvine Human Activity Recognition data) 
  * The data is also often referred to as the "UCI HAR Dataset" 
  * Details on the data are here [UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
  * The code assumes this data is in the working directory
* The data is extensive but the code depends on just a handful of key files 
  * Raw data
    * "test" data ```UCI HAR Dataset/test/X_test.txt``` which is created in the code as a data frame called ```test_data```
    * "train" data ```UCI HAR Dataset/train/X_train.txt``` which is created in the code as a data frame called ```train_data```
  * Row labels for the raw data
    * Each row in the raw data is for a certain participant in the study doing a certain type of activity
      * Participant IDs
        * test ``UCI HAR Dataset/test/subject_test.txt``` 
        * train ```UCI HAR Dataset/train/subject_train.txt```
      * Activity codes 
        * test ```UCI HAR Dataset/test/y_test.txt```
        * train ```UCI HAR Dataset/train/y_train.txt```
        * both are just numerical codes so we will use here ```UCI HAR Dataset/activity_labels.txt``` for the actual activity names 
  * Variables labels for the raw data
    * There are no variable names in the raw data  
    * Rather, the variable names are this file ```UCI HAR Dataset/features.txt```
* In case it is useful to anyone, here is a code that grabs this data from the web [grab_data.R](./grab_data.R)


