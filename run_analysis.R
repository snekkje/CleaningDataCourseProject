library(dplyr)
library(data.table)

# Subject numbers that correspond to a measurement in
# the train and test data respectively
subjectTrain <- fread("UCI HAR Dataset/train/subject_train.txt")
subjectTest <- fread("UCI HAR Dataset/test/subject_test.txt")

# Merging subject lists
subject <- rbind.data.frame(subjectTrain, subjectTest)
colnames(subject) <- "subject"

# Activites of a subject that correspond to a measurement in
# the train and test data respectively
activityTrain <- fread("UCI HAR Dataset/train/y_train.txt")
activityTest <- fread("UCI HAR Dataset/test/y_test.txt")

# Merging activity lists
activity <- rbind.data.frame(activityTrain, activityTest)
colnames(activity) <- "activity"

# Labelling the activity values in data frame into a more readable
# form
activity$activity[activity$activity == "1"] <- "WALKING"
activity$activity[activity$activity == "2"] <- "WALKING_UPSTAIRS"
activity$activity[activity$activity == "3"] <- "WALKING_DOWNSTAIRS"
activity$activity[activity$activity == "4"] <- "SITTING"
activity$activity[activity$activity == "5"] <- "STANDING"
activity$activity[activity$activity == "6"] <- "LAYING"

# Training and test set data
training <- fread("UCI HAR Dataset/train/X_train.txt")
test <- fread("UCI HAR Dataset/test/X_test.txt")

# Merging training and test sets
masterDF <- rbind.data.frame(training, test)

# Extracting the mean and standard deviation measurements.
features <- fread("UCI HAR Dataset/features.txt")
subsetDF <- select( masterDF, grep("mean()|std()", features$V2) )
colnames(subsetDF) <- grep("mean()|std()", features$V2, value = TRUE)

# Adding subject and activity columns
temp <- cbind.data.frame(subject, activity)
subsetDF <- cbind.data.frame(temp, subsetDF)
subsetDF <- arrange(subsetDF,subject)

# A second, independent tidy data set with the average of each variable for each activity and each subject
tidyData <- subsetDF %>% group_by(subject,activity) %>% summarise_each(funs(mean))
head(tidyData)
write.table(tidyData,"tidyData.txt", row.names = FALSE)







