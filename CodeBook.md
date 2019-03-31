The run_analysis.R script involves a series of steps in order to download, unzip, read, merge, tide up 
and summarize wearable computing data in an output .txt file. 
(Data from  Davide Anguita et al. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly  
Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012).  
Vitoria-Gasteiz, Spain. Dec 2012 

Data set available here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'

And full description of the experiment here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

There are, in total, 8 steps, the last 5 being the steps described in the course instructions.

* The first step involves the creation of certain folders for the data to be stored for handling. 
Datafolder <- 'UCI HAR Dataset'
Raw_data <- 'ICU_HAR_Dataset.zip'

*Then the script checks if the folder with the data already exists, if not it downloads and unzips the data. 
This is necessary because otherwise every time the scripts runs it will download the data again

* Next step reads txt files in the raw daya folder and creates data frames (except from the inertia signal data). 
These data frames are named: 
  	activity (6 obs., 2 variables), ID: 1.WALKING, 2.WALKING_UP, 3.WALKING_DOWN, 4.SITTING, 5.STANDING, 6.LAYING.
  	features (561 obs., 2 variables) accelerometer,gyroscope 3-axial signals tAcc(XYZ), tGyro(XYZ)
  	Subject_ID_test (2947 obs., 1 variable), test subjects 
  	Subject_ID_train (7352 obs., 1 variable), train subjects 
  	test_x (2947 obs., 561 variables), recordings of features test data
  	train_x (7352 obs., 561 variables), recordings of features train data
  	Activity_ID_test (2947 obs., 1 variable), test data of activity ID labels
  	Activity_ID_train (7352 obs., 1 variable), train data of activity ID labels

(Note: obs -> rows and variables -> columns)


* The next 5 steps follow the course project description
Step 1: Merges the training and the test sets to create one data set.
   X_dataset <- rbind(train_x, test_x)
   Subject_ID <- rbind(Subject_ID_test,Subject_ID_train)
   Activity_ID <- rbind(Activity_ID_test, Activity_ID_train)
  
  and 
  
   Merged_dataset<- cbind(Subject_ID,Activity_ID,X_dataset)
  
Step 2. Extracts the measurements on the mean and standard deviation for each measurement. 

Step 3. Uses descriptive activity names (from data frame activity) to name the activities in the data set

Step 4. Appropriately labels the data set with descriptive variable names.
  "^t" to "Time"
  "^f" to "Frequency"
  "Gyro" to "Gyroscope"
  "Acc" to "Accelerometer"

Step 5. From the data set in step 4, creates a second, independent tidy data set with the 
average of each variable for each activity and each subject.

  	Output_dataset (180 obs., 88 variables)

The Output data set is a .txt file created with write.table() function using row.name=FALSE
that can be found in the working directory.

