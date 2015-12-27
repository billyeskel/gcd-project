# section 1 - packages ---------------------------------------------------------------
# opens the packages, assuming they are installed
# if package(s) not installed then install in the console with install.packages
# for example, to install the package "tidyr" type: install.packages("tidyr")

## open libraries
library(Hmisc)
library(tidyr)
library(dplyr)
library(reshape2)

# section 2 - raw data data frames  ---------------------------------------------------------------
# create and organize data frames for raw data and both row and variable labels
# create the data frames "test_data" and "train_data"

## raw data 
### paths
path_data_test <- "./UCI HAR Dataset/test/X_test.txt"
path_data_train <- "./UCI HAR Dataset/train/X_train.txt"
### create raw data frames
test_data <- read.table(path_data_test, sep = "")
train_data <- read.table(path_data_train, sep = "")

# section 3 - create data frames for labels ----------------
# create data frames for labels for raw data, both row and variables labels
# get variable labels
# get row labels, ids and acitivity codes

## variable labels (same labels for both test and train)
### path
path_variable_names <- "./UCI HAR Dataset/features.txt"
### create data frame
variable_names_raw <- read.table(path_variable_names, sep = "", stringsAsFactors = FALSE)
### clean data frame to just the variable names
variable_names <- variable_names_raw[,2]

## rows labels: ids
### paths
path_id_test <- "./UCI HAR Dataset/test/subject_test.txt"
path_id_train <- "./UCI HAR Dataset/train/subject_train.txt"
### create data frames
test_id <- read.table(path_id_test, sep = "")
train_id <- read.table(path_id_train, sep = "")

## row labels: activity codes 
### paths
path_act_test <- "./UCI HAR Dataset/test/y_test.txt"
path_act_train <- "./UCI HAR Dataset/train/y_train.txt"
### create data frames
test_act <- read.table(path_act_test, sep = "")
train_act <- read.table(path_act_train, sep = "")

## row labels: activity code/name lookups
### path (same for both test and train)
path_act_codes <- "./UCI HAR Dataset/activity_labels.txt"
### create data frame
activity_codes <- read.table(path_act_codes, sep = "", stringsAsFactors = FALSE)
### add names
names(activity_codes) <- c("activity_code", "activity_name")

# section 4 - organize all row labels ------------------------
# including add activity code/names to other row labels for test and train 

## test data
### combine ids and acitivity codes
test_row_labels <- cbind(test_id, test_act)
### add names
names(test_row_labels) <- c("participant_id", "activity_code")
### do some checking to the console
describe(test_row_labels)
### lookup/merge in activity names for each activity code
test_row_labels2 <- merge(test_row_labels, activity_codes)
### do some more checking to the console
table(test_row_labels2$activity_code, test_row_labels2$activity_name)

## train data
### combine ids and acitivity codes
train_row_labels <- cbind(train_id, train_act)
### add names
names(train_row_labels) <- c("participant_id", "activity_code")
### do some checking to the console
describe(train_row_labels)
### lookup/merge in activity names for each activity code
train_row_labels2 <- merge(train_row_labels, activity_codes)
### do some more checking to the console
table(train_row_labels2$activity_code, train_row_labels2$activity_name)

# section 5 - add variable labels -------------------------
# add variable labels to the raw data
# do for test and train separately even though there is one variable name file only

## test data
names(test_data) <- variable_names
## train data
names(train_data) <- variable_names

# section 6 - add row labels --------------
# merge in row labels to the (already variable labeled) raw data
# do row labels for test and train separately 

### add test row labels to raw data
test_data_labeled <- cbind(test_row_labels2, test_data)

### do some checking to the console
describe(test_data_labeled$participant_id)
table(test_data_labeled$participant_id)
describe(test_data_labeled$activity_code)

### add train row labels to raw data
train_data_labeled <- cbind(train_row_labels2, train_data)

### do some checking to the console
describe(train_data_labeled$participant_id)
table(train_data_labeled$participant_id)
describe(train_data_labeled$activity_code)

# section 7 - combine test and train  ----------------------------------------
# combine labeled test and train data frames 
# now that the test and train data frames have row and variable lables, combine test and train
# call the combined data frame "data_merged"

data_merged <- rbind(test_data_labeled, train_data_labeled) 

# section 8 - filter -------
# filter to just variables with mean or std
# 4 steps: 
## 1. get mean variables into one data frame
## 2. get std variables into one data frame
## 3. get the row labels
## 4. merge labels and mean and std into a data frame called "filtered"

mean <- subset(data_merged, select = grepl(pattern = "mean", ignore.case = TRUE, names(data_merged)))
std <- subset(data_merged, select = grepl(pattern = "std", ignore.case = TRUE, names(data_merged)))
labels <- data_merged[,1:3]
filtered <- cbind(labels, mean, std)

### do some checking to the console
describe(filtered$participant_id)
table(filtered$participant_id)
describe(filtered$activity_code)

####### just for checking for now - remove later 
write.csv(filtered, file = "check_wide.csv", row.names=FALSE)

# section 9 - melt to tidy --------------------------------------------------------
# change from wide to long via dplyr melt
# export

## remove activity code since we can just use activity name now
filtered2 <- filtered[,-1] 

## melt
melted <- melt(filtered2, id=c("participant_id","activity_name"))

## order just to be extra organized
tidy <- melted[order(melted$participant_id, melted$activity_name, melted$variable), ]

## some checks to the console
table(tidy$participant_id, tidy$activity_name)

## export
write.csv(tidy, file = "check_tidy.csv", row.names = FALSE)
write.table(tidy, file ="tidy.txt", row.names = FALSE)

# section 10 - summarise ---------------------------------------------------
# average of each variable for each activity and each participant

## get average
means <- melted %>% 
     group_by(participant_id, activity_name, variable) %>%
     summarise(mean = mean(value))

## some checks to the console
table(means$participant_id, means$activity_name)

## export
write.csv(means, file = "check_means.csv", row.names=FALSE)
write.table(means, file ="tidy-means.txt", row.names = FALSE)

