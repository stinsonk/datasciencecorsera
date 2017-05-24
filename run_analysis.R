run_analysis <- function(){
##First block of code will import important files from working directory.  Requires the following files to be present in the WD:
##features.txt, activity_labels.txt, X_train.txt, y_train.txt, X_test.txt, y_test.txt, subject_train.txt, subject_test.txt
  
  features <- read.table("features.txt")
  activities <- read.table("activity_labels.txt")
  subject.test <- read.table("subject_test.txt")
  subject.train <- read.table("subject_train.txt")
  test <- read.table("X_test.txt")
  train <- read.table("X_train.txt")
  label.test <- read.table("y_test.txt")
  label.train <- read.table("y_train.txt")
  
##Second block of code will create and modify a list of measurement names, and a variable x to later subset measurement data frames.
##MEasurement names are currently set to take the mean and standard deviation of the 33 main measurements outlined in the features_info.txt file.
##Excluded from this are the meanFreq value from each measurement, and the 5 averaged signal means listed at the bottom of features_info.txt
##Column names had duplicate words and brackets removes, '-' replaced by '.' for easy reading, and otherwise uneddited to allow for easier data manipulation 
##and subsetting in downstream applicatons.
  
  x <- grep("mean[^Freq]|std", features$V2)
  features <- features[x,]
  nameslist <- c("subject", "activity", as.character(features$V2))
  nameslist <- tolower(nameslist)
  nameslist <- gsub("-", ".", nameslist)
  nameslist <- gsub("\\()", "", nameslist)
  nameslist <- gsub("bodybody", "body", nameslist)
  
##Third block of code modifies the activity list to allow more ready data manipulation, changing to lower case, and replacing '_' with '.'
  
  activitylist <- tolower(activities$V2)
  activitylist <- gsub("_", ".", activitylist)
  
##Fourth block of code subsets the test and train measurement data by the field selected above (x), adds subjet and activity data, and combines the two data frames.
##column names and activity names are also added, as selected above, and ordered first by subject, then by (numberic) activity.  Cached to global environment as fulldata.
  
  test <- cbind(subject.test, label.test, test[,x])
  train <- cbind(subject.train, label.train, train[,x])
  fulldata <- rbind(train, test)
  names(fulldata) <- nameslist
  fulldata <- fulldata[order(fulldata$subject, fulldata$activity),]
  fulldata <<- within(fulldata, activity <- factor(activity, labels = activitylist))

##Fifth block of code builds an empty data frame for mean data by activity for each subject.  A nested loop design subsets out data first by subject, then activity
##calculates the column means, and inputs it into the meandata dataframe.  Column and activity names are added as above, and the dataframe is cached to
##global environment as meandata.
  
  meandata <- data.frame()
  i = 1
  for(i in 1:30){
    workingsubject <- subset(fulldata, fulldata$subject == i)
    y = 1
    for(y in 1:6){
      workingactivity <- subset(workingsubject, workingsubject$activity == y)
      temp <- colMeans(workingactivity)
      meandata <- rbind(meandata, temp)
      y = y + 1
    }
    i = i + 1
  }
  names(meandata) <- nameslist
  meandata <<- within(meandata, activity <- factor(activity, labels = activitylist))
}