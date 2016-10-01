
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,"assignment.zip")
unzip("assignment.zip")
test_y<-read.table("./UCI HAR Dataset/test/y_test.txt",sep="", header=FALSE )
test<-read.table("./UCI HAR Dataset/test/X_test.txt",sep="", header=FALSE )
test_subject<-read.table("./UCI HAR Dataset/test/subject_test.txt",sep="", header=FALSE )
feature<-read.table("~/CleanData/UCI HAR Dataset/features.txt",sep="", header=FALSE )
feature<-feature[,2]
colnames(test)<-feature
test_data<-cbind(test_y,test)
colnames(test_data)[1]<-"activity"
test_data<-cbind(test_subject,test_data)
colnames(test_data)[1]<-"subject"
train_y<-read.table("./UCI HAR Dataset/train/y_train.txt",sep="", header=FALSE )
train<-read.table("./UCI HAR Dataset/train/X_train.txt",sep="", header=FALSE )
train_subject<-read.table("./UCI HAR Dataset/train/subject_train.txt",sep="", header=FALSE )
colnames(train)<-feature
train_data<-cbind(train_y,train)
colnames(train_data)[1]<-"activity"
train_data<-cbind(train_subject,train_data)
colnames(train_data)[1]<-"subject"
test_train<-rbind(test_data,train_data)
mean_std<-grep("mean|std",colnames(test_data))
mean_std<-c(1,2,mean_std)
test_train<-test_train[,mean_std]
freq<-grep("Freq",colnames(test_train))
test_train<-test_train[,-freq]            
label<-read.table("./UCI HAR Dataset/activity_labels.txt",row.names = 1)
label<-label[,1]
test_train$activity<-factor(test_train$activity,levels = c(1:6),labels = label)
colnames(test_train)<-sub("^t","time",colnames(test_train))
colnames(test_train)<-sub("^f","frequency",colnames(test_train))
colnames(test_train)<-sub("Mag","Magnitude",colnames(test_train))
colnames(test_train)<-sub("Acc","Accelerometer",colnames(test_train))
colnames(test_train)<-sub("Gyro","Gyroscope",colnames(test_train))
list<-colnames(test_train[,3:ncol(test_train)])
library(reshape2)
test_train_melt<-melt(test_train,id=c("subject","activity"),measure.vars = list)
second_data<-dcast(test_train_melt,subject+activity~variable, mean)
second_list<-paste0("mean-",list)
second_list<-c("subject", "activity",second_list)
colnames(second_data)<-second_list
rm(list=ls()[!(ls()=="second_data"|ls()=="test_train")])
