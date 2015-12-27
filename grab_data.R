# prep 1 - create and set "data" directory  ------------------------------------------------------------------
# create a directory called "data" and set it as the working directory

## create a directory called "data" if it does not exist already
if (!file.exists("data")) {
     dir.create("data")
}

## set the directory "data" as the working directory
setwd("./data")

# prep 2 - import and extract files ------------------------------------------------------------------
# import and extract UC Irvine (aka "UCI") "Human Activity Recognition" (aka "HAR") files from web based zip file
# retrieve web based zip file from UCI and download the files within it into the "data" directory
# result is a directory within "data" called "UCI HAR Dataset" 
# details on "UCI HAR Dataset" are here http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# resulting directories and files within "UCI HAR Dataset" are output to the console

# citation for the dataset: 
## Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz 
## A Public Domain Dataset for Human Activity Recognition Using Smartphones 
## 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013 
## Bruges, Belgium 24-26 April 2013

zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp <- tempfile() 
download.file(zipUrl,temp)
dataDownloaded <- date()
unzip(temp)
unlink(temp)

## list to the consule the resulting unzipped directories and files that are in the folder called "data"
list.files()
list.dirs()
list.files(all.files = TRUE, recursive = TRUE)

# prep 3 - a note on the files we will use --------------------------------
# there are a ton of files in "UCI HAR Dataset" but we will use only some:
# raw data
## the "test" data - "UCI HAR Dataset/test/X_test.txt" - to be created below as a data frame called "test_data"
## the "training" data - "UCI HAR Dataset/train/X_train.txt" -  to be created below as a data frame called "train_data"

# row labels for the raw data
## each row in the raw data is for a certain participant in the study doing a certain type of activity
### particpant ids are in 
#### test: "UCI HAR Dataset/test/subject_test.txt"
#### train: "UCI HAR Dataset/train/subject_train.txt"
### activity codes are in
#### test: "UCI HAR Dataset/test/y_test.txt"
#### train: "UCI HAR Dataset/train/y_train.txt"
#### both are just numerical codes so we will use here "UCI HAR Dataset/activity_labels.txt" for the actual activity names 

# variables labels for the raw data
## there are no variable names in the raw data
## variable names are here UCI HAR Dataset/features.txt
## we will convert these very technical variable names to more descriptive names in the code 