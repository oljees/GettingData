#Getting and cleaning data coursework
18/11/2015

This project takes data from accelerometers downloaded from the Samsung Galaxy S smartphone
as described in http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

It merges the training and test sets to create one dataset (combined)
which has column names as specified in the features file and activity labels specified in the
activity labels file.  It then selects measurements on mean and standard deviation from the combined file
and calculates the average of these for each activity and subject

Raw data for project is taken from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

This final repo contains
* cleandata.txt: the cleaned data file with average of each variable for each activity and subject
* run_analysis.R: the script which reads the raw data and generated cleandata.txt
* codebook: which describes variables in the cleandata.txt