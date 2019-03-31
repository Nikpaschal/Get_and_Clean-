# Get_and_Clean-
Getting and Cleaning Data Course Project - Wearable Computing Data

This a repository created for the purposed of the final course project in Getting and Cleaning Data Coursera module.  

In brief, this project involves the design of a script to manage data from wearable computing devices. The original data and full description of experiments can be found in the publication and links below:

Davide Anguita et al. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012).  Vitoria-Gasteiz, Spain. Dec 2012

Data set available here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'

Full description of the experiment here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

 
The Get_and_Clean repository contains three files 
1.	This README.md
2.	The CodeBook.md
3.	The run_analysis.R script

The CodeBook.md describes steps, variables, data and certain functions used to download, unzip, read, merge, tide up and summarize wearable computing data. 

The run_analysis.R contains all the appropriate calls and functions required to fulfill the tasks described in the project’s definition. This script produces a .txt output data file that contains the average of mean and standard deviation of each variable for each activity and subject. 
