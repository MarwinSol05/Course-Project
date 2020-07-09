setwd("C:\\Users\\MARK\\Desktop\\Marwin Documents\\Coursera Courses\\3. Getting and Cleaning Data\\Course Project\\UCI HAR Dataset")

library(dplyr)

#Collecting relevant data

features<-read.table("./features.txt",col.names=c("n","Functions"))
head(features)

activity<-read.table("./activity_labels.txt",col.names=c("Code","Activity"))
head(activity)

subject_train<-read.table("./train/subject_train.txt",col.names=c("Subject"))
head(subject_train)

x_train<-read.table("./train/X_train.txt",col.names=features$Functions)
head(x_train)

y_train<-read.table("./train/y_train.txt",col.names=c("Code"))
head(y_train)

subject_test<-read.table("./test/subject_test.txt",col.names=c("Subject"))
head(subject_test)

x_test<-read.table("./test/X_test.txt",col.names=features$Functions)
head(x_train)

y_test<-read.table("./test/y_test.txt",col.names=c("Code"))
head(y_test)

#Merging Data
Subject<-rbind(subject_train,subject_test)
head(Subject)
x<-rbind(x_train,x_test)
head(x,n=2)
y<-rbind(y_train,y_test)
head(y,n=2)
y

mergedat<-cbind(Subject,y,x)
head(mergedat)

#Forming Tidy Data Set
tidydat<-mergedat%>%select(Subject,Code,contains("mean"),contains("std"))
head(tidydat,n=40)
ncol(tidydat)

tidydat$Code<-activity[tidydat$Code,2]
head(tidydat,n=10)

#Renaming Columns
colnames(tidydat)[2]="Activity"
colnames(tidydat)<-gsub("Acc", "Accelerometer",colnames(tidydat))
colnames(tidydat)<-gsub("Gyro", "Gyroscope",colnames(tidydat))
colnames(tidydat)<-gsub("BodyBody", "Body",colnames(tidydat))
colnames(tidydat)<-gsub("Mag", "Magnitude",colnames(tidydat))
colnames(tidydat)<-gsub("^t", "Time",colnames(tidydat))
colnames(tidydat)<-gsub("^f", "Frequency",colnames(tidydat))
colnames(tidydat)<-gsub("tBody", "TimeBody",colnames(tidydat))
colnames(tidydat)<-gsub("mean", "Mean",colnames(tidydat), ignore.case = TRUE)
colnames(tidydat)<-gsub("std", "STD",colnames(tidydat), ignore.case = TRUE)
colnames(tidydat)<-gsub("freq", "Frequency",colnames(tidydat), ignore.case = TRUE)
colnames(tidydat)<-gsub("angle", "Angle",colnames(tidydat))
colnames(tidydat)<-gsub("gravity", "Gravity",colnames(tidydat))

#Summary
finaldat<-tidydat %>%
    group_by(Subject, Activity) %>%
    summarize_all(funs(mean))
finaldat

write.table(finaldat,"FinalData.txt",row.name=FALSE)

str(finaldat)