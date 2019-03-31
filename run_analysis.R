# run_analysis.R comprises of a series of functions and commands to download, tide up, merge and 
# present data from a Samsung wearable computing data set, originally from:
#
# Davide Anguita et al. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly 
# Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). 
# Vitoria-Gasteiz, Spain. Dec 2012

# enjoy!

library(dplyr) # This packages contains functions and calls necessary for managing data/frames

# This step Initiates necessary folders to be checked if they exist in the next step 
Datafolder <- 'UCI HAR Dataset'
Raw_data <- 'ICU_HAR_Dataset.zip'


# This step checks if the folder with the data already exists, if not it downloads and unzips the data
# this is necessary because otherwise everytime the scripts runs it will download the data again
if(!file.exists("./UCI HAR Dataset")) 
  if(!file.exists("ICU_HAR_Dataset.zip")) {
    Raw_data <-"ICU_HAR_Dataset.zip"
    fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
    download.file(fileUrl, Raw_data)
}

unzip(Raw_data)
  
  
# This step reads txt files and creates data frames from the raw data folder (except inertia signal data)
  activity <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("ID", "activity"))
  features <- read.table("./UCI HAR Dataset/features.txt", col.names = c("no.", "functions"))
  Subject_ID_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
  Subject_ID_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
  test_x <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
  train_x <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
  Activity_ID_test <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "ID")
  Activity_ID_train <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "ID")
  
# (Optional) check files 
# View(activity)
# View(features)
# View(Subject_ID_test)
# View(Subject_ID_train)
# View(test_x)
# View(train_x)
# View(Activity_ID_test)
# View(Activity_ID_train)
  
# Step 1. Merges the training and the test sets to create one data set.
  # first with rbind(): binds the rows of different data sets 
  X_dataset <- rbind(train_x, test_x)
  Subject_ID <- rbind(Subject_ID_test,Subject_ID_train)
  Activity_ID <- rbind(Activity_ID_test, Activity_ID_train)
  # then with cbind(): binds the columns of the resulting data sets
  Merged_dataset<- cbind(Subject_ID,Activity_ID,X_dataset)
  
  # View(Merged_dataset)
  
  
# Step 2. Extracts the measurements on the mean and standard deviation for each measurement.
  Extract_data <- Merged_dataset %>%
                select(subject, ID, contains("mean"), contains("std"))
  # View(Extract_data)
  
# Step 3. Uses descriptive activity names to name the activities in the data set
  Extract_data$ID <- activity[Extract_data$ID,2]
  
# Step 4. Appropriately labels the data set with descriptive variable names.
  names(Extract_data) <- gsub("^t", "Time", names(Extract_data))
  names(Extract_data) <- gsub("^f", "Frequency", names(Extract_data))
  names(Extract_data) <- gsub("Gyro", "Gyroscope", names(Extract_data))
  names(Extract_data) <- gsub("Acc", "Accelerometer", names(Extract_data))
  
  
# Step 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
# The Ouput data set is a .txt file created with write.table() function using row.name=FALSE

  Output_dataset <- Extract_data %>%
                    group_by(subject, ID) %>%
                    summarise_all(list(mean))
                  write.table(Output_dataset, "Output_Data.txt", row.name = FALSE)
                
# The txt file has been created in the working diectory, it can be also be viewed in the scipt console
# View(Output_dataset)
