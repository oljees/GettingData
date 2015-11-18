#This script loads data from accelerometers from the Samsung Galaxy S smartphone
#It merges the training and test sets to create one dataset (combined)
#which has column names as specified in the features file and activity labels specified in the
#activity labels file. 
#It then selects measurements on mean and standard deviation from the combined file
# and calculates the average of these for each activity and subject

#load dplyr package
library(dplyr)

#download data from
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#and unzip

#set working directory as UCI HAR Dataset directory of unzipped data
#setwd("/media/jorgen/UUI/gettingData/assignment/UCI HAR Dataset")
setwd("/media/jorgen/UUI/gettingData/assignment")

##read relevant files 

#labels and features
activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt")
features<-read.table("UCI HAR Dataset/features.txt")
#training
xtrain<-read.table("UCI HAR Dataset/train/X_train.txt")
ytrain<-read.table("UCI HAR Dataset/train/y_train.txt")
strain<-read.table("UCI HAR Dataset/train/subject_train.txt")
#test
xtest<-read.table("UCI HAR Dataset/test/X_test.txt")
ytest<-read.table("UCI HAR Dataset/test/y_test.txt")
stest<-read.table("UCI HAR Dataset/test/subject_test.txt")

#compile training data
#first add names to xtrain,ytrain,strain
#names are variable V2 of features file
#naming each subset before binding helps with traceability

names(xtrain)<-features$V2
names(strain)<-"subjectid"
names(ytrain)<-c("label")
train<-bind_cols(list(ytrain,strain,xtrain))   #this adds subjects(strain) and activity(ytrain) to data(xtrain)
train$datasource<-"train"  #this variable can be used to identify rows from train or test in combined data

#compile test data: repeat as for training

names(xtest)<-features$V2
names(stest)<-"subjectid"
names(ytest)<-c("label")
test<-bind_cols(list(ytest,stest,xtest))
test$datasource<-"test"

#merge test and train datasets
#note this drops duplicated columns for bandsEnergy() due to incompatibility with column name restrictions in R
#basically it has some comma's "," which make the rest of the colname look like a duplicate
#but these columns are not needed for this assignment so ok to drop
combined<-bind_rows(train,test)   

#check data
dim(combined)
table(combined$datasource)  #shows all data from test and train present
n_distinct(combined$subjectid)  #30 subjects

#from this code one can get some idea of the number of entries per subject
group_by(combined,subjectid)%>%
  summarise(n())

#extract mean and standard deviation columns along with the activity label and subjectid
mean_std<-combined%>%
  select(label,subjectid,contains("mean()"), contains("std()"))
mean_std

#rename activity labels

#first name variables of activity_labels dataframe
activity_labels<-activity_labels%>%
    rename(label=V1,
           activityname=V2)

#now merge activity_labels with mean_std
mean_std<-full_join(activity_labels,mean_std,by="label") %>%
    select(-label)  #then drop label as uneccesary


#create clean data with average of each variable for each activity and subject
cleandata<-mean_std %>%
    group_by(activityname,subjectid) %>%
    summarise_each(funs(mean))

#add prefix to column names to show that they are now average values for each activity and subject
colnames(cleandata)[3:68]<-paste("avg",colnames(cleandata)[3:68], sep="_")

#tidy up names to make it more readable
colnames(cleandata)[3:68]<-gsub("-","_",colnames(cleandata)[3:68])
colnames(cleandata)[3:68]<-gsub("\\(","",colnames(cleandata)[3:68])
colnames(cleandata)[3:68]<-gsub("\\)","",colnames(cleandata)[3:68])
colnames(cleandata)[3:68]<-gsub("BodyBody","Body",colnames(cleandata)[3:68])


#export data
write.table(cleandata,file="cleandata.txt",row.names = F)


