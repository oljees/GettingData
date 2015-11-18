#Codebook for cleandata

The first 2 variables are the activityname and subject ID


The rest of the variables are made up of up to 4 parts separated by underscore “_”

The first part is “avg” which is “average”, showing that each variable is an average for each subject and activity

The second part is the body of the variable name.  The following extract from the README files of the raw data explain how they were derived and their meanings

*
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

*

For each of these various variables were estimated, of which only the **mean** and **standard deviations** were included in cleandata.  In cleandata, mean variables have “mean” and standard deviations have “std” in their variable names.

Data from the accelerometer and gyroscope which have 3-axial raw signals tAcc-XYZ and tGyro-XYZ are represented with each axis in a separate variable.

So for example

avg_tBodyAcc_mean_X is the average of the mean time domain body acceleration signal on the X axis

avg_tBodyAcc_mean_Y is the average of the mean time domain body acceleration signal on the Y axis

avg_tBodyAcc_mean_Z is the average of the mean time domain body acceleration signal on the Z axis

avg_tGravityAcc_mean_X is the average of the mean time domain gravity acceleration signal on the X axis

avg_tGravityAcc_mean_Y is the average of the mean time domain gravity acceleration signal on the Y axis

avg_tGravityAcc_mean_Z is the average of the mean time domain gravity acceleration signal on the Z axis

This applies for all 3 axial measurements but not their respective magnitudes ( tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag)

