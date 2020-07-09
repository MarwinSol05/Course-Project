Assign data to each variable
features contains data of features.txt 
activities contains data of activity_labels.txt 
List of activities performed when the corresponding measurements were taken and its codes (labels)
subject_test contains data of subject_test.txt 
contains test data of 9/30 volunteer test subjects being observed
x_test contains data of X_test.txt 
recorded features test data
y_test conatins data of y_test.txt 
data of activities’code labels
subject_train contains data of subject_train.txt
training data of 21/30 volunteer subjects being observed
x_train contains data of X_train.txt 
recorded features train data
y_train contains data of y_train.txt
train data of activities’code labels

Merges the training and the test sets to create one data set
x contains data of x_train & x_test
y contains data of y_train & y_test
Subject contains data of subject_train & subject_test
tidydat contains data of x,y,Subject having only mean & std variables

Uses descriptive activity names to name the activities in the data set
Entire numbers in code column of the tidydat replaced with corresponding activity taken from second column of the activity variable

Appropriately labels the data set with descriptive variable names
code column in tidydat renamed into Activity & other columns are named accordingly

From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
finaldatis created by sumarizing tidydat taking the means of each variable for each activity and each subject, after being grouped by subject and activity.
Export finaldat into FinalData.txt file.
