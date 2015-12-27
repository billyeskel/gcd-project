# Codebook

## Tidy data
* [tidy-data](https://www.dropbox.com/s/hsz0yfsvkf6bakx/tidy.txt?dl=0)
  * Post all the twisting and turning for labeling and to make tidy
  * But before the final summarize to get the average of each variable for each activity and each subject
* Each rows is a measure of an activity occasion
* Variables
  * ```participant_id```
    * The person who did the activity
    * There were 30 participants
  * ```activity_name```
    * The type of activity
    * Activity types: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING
  * ```variable```
    * The type of measurement
    * Very technical from accelerometer and  gyroscope inside phone
    * Details in ```UCI HAR Dataset/features_info.txt``` [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
  * ```value```
    * The measurement values themselves

## Summarized data
* [summarized data](https://www.dropbox.com/s/26xf8gkrfqf3pag/tidy-means.txt?dl=0)
  * This is the objective of the code and the output submitted for the Course Project
  * As described by the course: get the "average of each variable for each activity and each subject" see [here](https://class.coursera.org/getdata-035/human_grading) for project details
* Variables
  * ```participant_id```
    * ID of the participant
  * ```activity_name```
    * Name of the activity
  * ```variable```
    * The type of measurement
  * ```mean```
    * The mean of the measurement for each activity and each participant (aka subject)
