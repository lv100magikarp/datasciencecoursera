##Codebook for data on the accelerometer on Samsung phones

###subject.no:
     Class: integer.
     Levels: integers 1:30.
     Unit: none.
     Each level represents an individual subject in the experiment.

###activity:
     Class: character.
     Levels: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS.
     Unit: none.
     Each level represents a type of activity the subject had done.

  
###All other variables:
     class: double
     levels: continuous -1:1
     unit: none (data are normalised)

     Variables explained:
     t- (time)
        time signals captured
     f- (Fast Fourier Transform)
        time data transformed by Fast Fourier Transform
     -BodyAcc-
        body acceleration measurement
     -GravityAcc-
        gravity acceleration
     -BodyAccJerk-
        jerk measurements obtained using body linear acceleration and angular velocity
     -BodyGyro-
        body orientation measurements
     -BodyGyroJerk-
        jerk measurements of change in body orientation
     -Mag
        magnitude of measurements under Euclidean norm
     -X/Y/Z
        corresponding axis along which the variable is measured
     -mean()
        mean value
     -std()
        standard deviation

  
  This dataset was obtained by joining the normalised test and train data in the original data sets, extracting only 
  the data pertaining to the mean and standard deviation of the measurements, and then calculating average of the 
  specific variable for the corresponding subject and activity.
     