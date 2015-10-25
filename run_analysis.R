library(dplyr)

#reading data
labels <- read.table('./UCI HAR Dataset/activity_labels.txt')
features <- read.table('./UCI HAR Dataset/features.txt')
strain <- read.table('./UCI HAR Dataset/train/subject_train.txt')
xtrain <- read.table('./UCI HAR Dataset/train/X_train.txt')
ytrain <- read.table('./UCI HAR Dataset/train/y_train.txt')
    ytrain[,1] <- as.numeric(ytrain[,1])
stest <- read.table('./UCI HAR Dataset/test/subject_test.txt')
xtest <- read.table('./UCI HAR Dataset/test/X_test.txt')
ytest <- read.table('./UCI HAR Dataset/test/y_test.txt')
    ytest[,1] <- as.numeric(ytest[,1])

#finding specified variables
match <- grep('mean|std',as.character(features[,2]))
matchnames <- as.character(features[match,2])

#combining/manipulating data
train <- bind_cols(strain,ytrain,xtrain[match])
test <- bind_cols(stest,ytest,xtest[match])
data <- rbind(train,test)
colnames(data) <- c('subject.no','activity',matchnames)
data[['activity']] <- plyr::mapvalues(data[['activity']],
                                1:6,as.character(labels[,2]))

#average of each variable for each activity and each subject
grouped <- group_by(data,subject.no,activity)
clean <- summarise_each(grouped,funs(mean))

