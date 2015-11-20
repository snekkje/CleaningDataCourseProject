#Tidy Data Assignment - Code book
Jake, 21/11/2015


Data for the project was sourced from UCI who collected it from accelerometers in the Samsung Galaxy S smartphone carried about by 30 subjects. The files that we are interested in from the file "UCI HAR Dataset" are

* README.txt : Essential reading to get the big picture idea behind the data in the "UCI HAR Dataset"
* activity\_labels.txt : Contains the six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING), performed by each subject
* features_info.txt : Describes what data was collected and a brief description about how it was measured. This also forms the reference guide to provide descriptions for variable names as required in Step 4 of the assignment.
* features.txt : Lists each measurement variable

The data itself is found in the "test" and "train" folders, where:

* X_test.txt : Observation data for each variable
* y_test.txt : Activity corresponding to that obseravation
* subject_test.txt : Subject involved while making that observation

and similarly for the "train" txt files

#Methodology
Step 1 took the test/train pairs of txt files, described above, and created three new objects which were the pairs merged as one. Step 2 required removing all variables from the newly created merged subject\_test/subject\_train object that was not a mean (mean()) or standard deviation (std()) of an experimental measurement. Step 3 addressed the fact that the merged y\_test/y\_train object only had numbers associated with the six activities mentioned above and converted those numbers into a human readable string. 

In step 4 where the variables are labelled, I have stuck to the convention laid out in features_info.txt because I feel that rewriting the variable names will cause as much difficulty in deciphering as just leaving it as is. In summary though, the features (or variables) discussed derive from readings of accelerometer and gyroscope 3-axial raw signals. Relevant variables to this project are (Note, '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions):

* tBodyAcc-XYZ and tGravityAcc-XYZ : Body and gravity acceleration signals (preceding t denotes variable is in the time domain)
* tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ : Jerk signals -> body linear acceleration and angular velocity with respect to time
* tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag and tBodyGyroJerkMag : Magnitude of the above three-dimensional signals as calculated using the Euclidean norm
* fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag and fBodyGyroJerkMag: The Fast Fourier Transform (FFT) applied to some of these signals (preceding f denotes variable is in the frequency domain)

For further information the reader can refer to features_info.txt. With the above completed Step 5 saw the measurment data broken down into groups of subject/activity pairs where then a new dataset could be created that showed the average of each the variables associated with each pair. This dataset can be found in "tidyData.txt".


