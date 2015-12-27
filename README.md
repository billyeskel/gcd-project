# How the Code Works 
* This is for the run_analysis.R code for the Course project for Coursera Johns Hopkins Getting and Cleaning Data course
* Click on this link [run_analysis.R code](./run_analysis.R) for the code itself (or see the code in this repo)

# Key data for the code
* The data is the Samsung Data (aka University of California at Irvine Human Activity Recognition data) 
  * The data is also often referred to as the "UCI HAR Dataset" 
  * Details on the data are here [UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
  * The code assumes this data is in the working directory
* The data is extensive but the code depends on just a handful of key files 
  * Raw data
    * Big Picture
      * The data is 86 types of movement data as recorded from Samsung phones 
      * It is for 6 types of activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING)
      * These activities were recorded from 30 participants (on roughly 300-400 ocassions per participant)  
    * There are 2 raw data sets
      * "test" data ```UCI HAR Dataset/test/X_test.txt``` which is created in the code as a data frame called ```test_data``` 
        * 2947 rows of activity ocassions across the 30 participants 
      * "train" data ```UCI HAR Dataset/train/X_train.txt``` which is created in the code as a data frame called ```train_data```
        * 7352 rows of activity ocassions across the 30 participants 
      * Both of these have the same variables and will be merged in the code into a single raw data set (with all labels applied)
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
    * They are for pretty obtuse types of movement measurements that the code will try to make less obtuse through more descritive names
* In case it is useful to anyone, here is a code that grabs this data from the web [grab_data.R](./grab_data.R)

# Walkthrough of the code 
* Section 1: Libraries 
 * [Hmisc](https://cran.r-project.org/web/packages/Hmisc/index.html) for some data summaries 
 * [tidyr](https://cran.r-project.org/web/packages/tidyr/index.html) and [dplyr](https://cran.r-project.org/web/packages/dplyr/index.html) for data wrangling and some summarize by groups
 * [reshape2](https://cran.r-project.org/web/packages/reshape2/index.html) to convert from long to wide for tidy data and to apply summarize functions
* Section 2: Create data frames for the raw data 
 * test ```UCI HAR Dataset/test/X_test.txt``` 
 * train ```UCI HAR Dataset/train/X_train.txt``` 
* Section 3: Create data frames for the labels
 * Both the variable lables (types of measurements) 
 * And the row labels (participants and activity types)
* Section 4: Organize the row labels 
* Section 5: Apply the variable labels to the raw data 
 * Again, these are for 86 pretty obtuse types of movement measurements
 * The code will try to make less obtuse through more descritive names later on
* Section 6: Apply the row labels to the raw data 
 * After this we we know for each row of raw data the participant ID and the activity type for the activity ocassion of that row
* Section 7: Combine test and train data
 * Now that the test and train data frames have row and variable labels, combine test and train 
* Section 8: Filter to just measurement variables that compute mean or std
* Section 9: Melt (aka transpose or reshape) from a wide to a long data frame
* Section 10: Summarize to get average of each variable for each activity and each participant

