###How the script works

The first line runs the dplyr package

The second part reads the data in your working directory. The data have to be unzipped.
The y_train and y_test data are coerced into unmeric data.

The third part sorts out which variables are calculations of means and standard deviations using grep.

The fourth part merges the separated data into a whole big data set.
The column names are changed so each measurement matches each column of data.
The activity indices (from y_test and y_train) are mapped onto their true activity names using mapvalues in the plyr package.

The final part creates a data frame grouped by individual subjects and the activity they did.
The mean of each measurement is calculated for each specific subject and activity.


The codebook "codebook.md" explains the dataset and variables in the output data.