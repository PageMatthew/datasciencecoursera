# Script to read in the Training and Testing datasets for UCI HAR Cell phone sensor data,
# merge them into one set, add the test subject column as well as the subjects activity,
# give meaningful labels to the data and then to create a final dataset with the mean of
# each observational variable for each activity type and subject
 

# label now so we get the labels after the merge of test and training
# set nrows so the last empty row doesn't mess things up
columnlabels <- read.table("./UCI HAR Dataset/features.txt",stringsAsFactors = FALSE,nrows = 561)
# bring in test data
testdata <- read.fwf("./UCI HAR Dataset/test/X_test.txt"
                     ,rep.int(16, 561)
                     ,header = FALSE
                     ,col.names = columnlabels$V2
                     ,stringsAsFactors = FALSE
                     ,colClasses = "numeric")
# bring in subject (person) column for test data
testsubjectdata <- read.table("./UCI HAR Dataset/test/subject_test.txt",stringsAsFactors = FALSE)
# bring in activity column for test data
testactivitydata <- read.table("./UCI HAR Dataset/test/y_test.txt",stringsAsFactors = FALSE)
# merge test dataframe and columns together
testdataclean <- testdata[,grep("-std\\(\\)|-mean\\(\\)",columnlabels$V2)]
testdataclean$subject <- testsubjectdata$V1
testdataclean$activity <- testactivitydata$V1

# bring in training data
traindata <- read.fwf("./UCI HAR Dataset/train/X_train.txt"
                      ,rep.int(16, 561)
                      ,header = FALSE
                      ,col.names = columnlabels$V2
                      ,stringsAsFactors = FALSE
                      ,colClasses = "numeric")
# bring in subject (person) column for train data
trainsubjectdata <- read.table("./UCI HAR Dataset/train/subject_train.txt",stringsAsFactors = FALSE)
# bring in activity column for train data
trainactivitydata <- read.table("./UCI HAR Dataset/train/y_train.txt",stringsAsFactors = FALSE)
# merge train dataframe and columns together
traindataclean <- traindata[,grep("-std\\(\\)|-mean\\(\\)",columnlabels$V2)]
traindataclean$subject <- trainsubjectdata$V1
traindataclean$activity <- trainactivitydata$V1

# merge test and training data
finaldata <- rbind(testdataclean,traindataclean)

# name the activities in the data set
activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt",header = FALSE,stringsAsFactors = FALSE)
finaldata$activity = as.factor(finaldata$activity)
levels(finaldata$activity) <- activitylabels$V2

# create second dataset with average of each variable for each activity and each subject
finaldatamelted = melt(finaldata,id=c("subject","activity"))
finaldatamean = dcast(finaldatamelted,subject+activity ~ variable, mean)
# add in the labels again because they seem to disappear during melting and casting
finaldatamean$activity = as.factor(finaldatamean$activity)
levels(finaldatamean$activity) <- activitylabels$V2
write.table(finaldatamean,"UCIHARFinalDataTidy.txt", row.names = FALSE)