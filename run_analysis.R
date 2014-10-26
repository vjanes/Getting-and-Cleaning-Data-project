##GETTING STARTED##################################################################

##importing and formating tables

##import
activity_labels<-read.csv("UCI HAR Dataset/activity_labels.txt",sep=" ",header=FALSE)
features<-read.csv("UCI HAR Dataset/features.txt",sep=" ",header=FALSE)
colnames(activity_labels)<-c("activ_code","activity")

X_test<-read.csv("UCI HAR Dataset/test/X_test.txt",sep="",header=FALSE)
X_train<-read.csv("UCI HAR Dataset/train/X_train.txt",sep="",header=FALSE)

subject_train<-read.csv("UCI HAR Dataset/train/subject_train.txt",sep="",header=FALSE)
colnames(subject_train)="subj_VAL"
subject_test<-read.csv("UCI HAR Dataset/test/subject_test.txt",sep="",header=FALSE)
colnames(subject_test)="subj_VAL"

y_test<-read.csv("UCI HAR Dataset/test/y_test.txt",sep="",header=FALSE)
colnames(y_test)="y_VAL"
y_train<-read.csv("UCI HAR Dataset/train/y_train.txt",sep="",header=FALSE)
colnames(y_train)="y_VAL"

##adding line and sample labels
line<-cbind(sampl=rep("test",nrow(X_test)),line=1:nrow(X_test))
X_test<-cbind(line,X_test)
line<-cbind(sampl=rep("test",nrow(y_test)),line=1:nrow(y_test))
y_test<-cbind(line,y_test)
line<-cbind(sampl=rep("test",nrow(subject_test)),line=1:nrow(subject_test))
subject_test<-cbind(line,subject_test)

line<-cbind(sampl=rep("train",nrow(X_train)),line=1:nrow(X_train))
X_train<-cbind(line,X_train)
line<-cbind(sampl=rep("train",nrow(y_train)),line=1:nrow(y_train))
y_train<-cbind(line,y_train)
line<-cbind(sampl=rep("train",nrow(subject_train)),line=1:nrow(subject_train))
subject_train<-cbind(line,subject_train)

if(exists("line")){rm(line)}

#PART1#######################################################################

##merging
X_test<-merge(y_test,X_test,by=c("line","sampl"))
X_test<-merge(subject_test,X_test,by=c("line","sampl"))

X_train<-merge(y_train,X_train,by=c("line","sampl"))
X_train<-merge(subject_train,X_train,by=c("line","sampl"))

##stitching rows
X_all<-rbind(X_test,X_train)

#PART2#######################################################################

##selecting features using grep function
red_feat<-rbind(features[(grep("mean()",features$V2,fixed=TRUE)),],
                features[(grep("std",features$V2)),])
red_feat<-red_feat[order(red_feat$V1),]
red_feat_cols<-red_feat[,1]+4

##extracting mean/sd columns
X_all<-X_all[,c(c(1:4),red_feat_cols)]

#PART3#######################################################################

##labelling activities
colnames(X_all)[4]<-"activ_code"
X_all<-merge(activity_labels,X_all,by="activ_code")
X_all<-X_all[,-c(1)]


#PART4#######################################################################

##labelling variables
colnames(X_all)<-c("activity","line","sample","subject",as.character(red_feat[,2]))

##some clean up:
X_all<-X_all[,-c(2,3)]
X_all<-X_all[c(2,1,3:68)]
tidy1<-X_all

##############################
#TIDY DATA SET IN df "tidy1" 
#############################


#PART5#######################################################################

##As required means "for each activity and each subject"

tidy2_sub<-aggregate(tidy1[3:68], by=list(group=tidy1$subject),FUN=mean)
tidy2_act<-aggregate(tidy1[3:68], by=list(group=tidy1$activity),FUN=mean)
tidy2<-rbind(tidy2_sub,tidy2_act)

##############################
#TIDY DATA SET IN df "tidy2"
#
#data is mixed in the table by subject or activity
#this doesn't seem very tidy or very pertinent
#but it is what the assignment asked for
#############################

write.table(tidy2,file="tidy2.txt",row.names=FALSE)

