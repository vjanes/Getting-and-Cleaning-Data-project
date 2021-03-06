Code Book: tidy1 file
====================

Data is provided by a smartphone accelerometry experiment.
Activities where conducted by a number of subject.
Smartphone cinetic data was recorded.
Cinetic data was averaged for each subject and for each activity.

##Group column
Group column contains the mean() grouping label.
Data was averaged both by subjects and by activity.
Rows with a numeric value in the group column are relative to subject, number being subject id for experiment.
Rows with a text value in the group column are relative to activties and are self-explaining.
Mixing activities and subjects in the same column was ruled as an assignment requirement.
Both group are exclusive other the same data sample.

##Feature Selection
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).
These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Variables were treated by mean and standard deviation.

Then those means and standard deviations averaged (mean function) aggregated by experiment subjects and activities respectively (subjects and activities are two subdivisions of the same sample).

###Measurements :

tBodyAcc-XYZ; 
tGravityAcc-XYZ ;
tBodyAccJerk-XYZ ;
tBodyGyro-XYZ ;
tBodyGyroJerk-XYZ ;
tBodyAccMag ;
tGravityAccMag ;
tBodyAccJerkMag ;
tBodyGyroMag ;
tBodyGyroJerkMag ;
fBodyAcc-XYZ ;
fBodyAccJerk-XYZ ;
fBodyGyro-XYZ ;
fBodyAccMag ;
fBodyAccJerkMag ;
fBodyGyroMag ;
fBodyGyroJerkMag ;

###Variables :
The set of variables that were estimated from these signals are:
mean(): Mean value
std(): Standard deviation

The data in the "tidy1" table is THE AVERAGE OF THOSE DATA over relevant aggregation group.

