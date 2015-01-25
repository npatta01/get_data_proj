library(plyr)
library(dplyr)

#folder of dataset
data_folder="UCI_HAR_Dataset"

#test folder
test_folder = paste (data_folder,"/test", sep="")
#train folder
train_folder = paste (data_folder,"/train", sep="")

##########Part 1: Merge train and test data ################

# read file containing feature id and feature name mapping
features<-read.table(paste(data_folder,"/features.txt",sep=""))
colnames(features) <- c("featureId","featureName")



# read test data from separate files
x_test = read.table(paste(test_folder,"/X_test.txt",sep=""),header=FALSE)
y_test = read.table(paste(test_folder,"/y_test.txt",sep=""),header=FALSE)
subject_test = read.table(paste(test_folder,"/subject_test.txt",sep=""),header=FALSE)


# Assigin column names to the test data
colnames(subject_test)  = "subjectId";
colnames(x_test)        = features[,2]; 
colnames(y_test)        = "activityId";

# combined test data
test_data <- cbind(x_test,y_test,subject_test)

#read train data from separate files
x_train = read.table(paste(train_folder,"/X_train.txt",sep=""),header=FALSE)
y_train = read.table(paste(train_folder,"/y_train.txt",sep=""),header=FALSE)
subject_train = read.table(paste(train_folder,"/subject_train.txt",sep=""),header=FALSE)

# Assigin column names to the train data
colnames(subject_train)  = "subjectId";
colnames(x_train)        = features[,2]; 
colnames(y_train)        = "activityId";


#combined train data
train_data <- cbind(x_train,y_train,subject_train)


#combine test and train data
all_data <- rbind(test_data,train_data) 







##########Part 2: extract only mean and std ################

#features that are mean and std
mean_std_features <- grep("mean|std",colnames(all_data))

y_col_id<-length(all_data)-1
sub_col_id<-length(all_data)
all_data_mean_sd_only_y_subject<-all_data[,c(mean_std_features,y_col_id,sub_col_id)]

all_data <- all_data_mean_sd_only_y_subject




##########Part 3: activity name #############################

#  read activity data
activities<-read.table(paste(data_folder,"/activity_labels.txt",sep=""))
#name activities
colnames(activities)<-c("activityId","activityName")


all_data<-merge(activities,all_data,by="activityId")


##########Part 4: label data set appropriately #############################


#remove activity ID from dataset
all_data<-select(all_data,-(activityId))

#replace mean with uppercase Mean
names(all_data)<-gsub("mean", "Mean", names(all_data))
#replace Acc to Acceleration
names(all_data)<-gsub("Acc", "Acceleration", names(all_data))
#replace std to StdDev
names(all_data)<-gsub("std", "StdDev", names(all_data))
#replace std to StdDev
names(all_data)<-gsub("Gyro", "Gyroscope", names(all_data))
#replace Mag to Magnitude
names(all_data)<-gsub("Mag", "Magnitude", names(all_data))
#replace t with Time
names(all_data)<-gsub("^t", "time", names(all_data))
names(all_data)<-gsub("^f", "frequency", names(all_data))


##########Part 5: tidy data #############################

# group by activity name and subject and take the column means for the group
tidy<- ddply(all_data, .(activityName,subjectId), function(x) colMeans(subset(x, select= -c(activityName,subjectId))))

#save the tidy file
write.table(tidy,file="tidy.txt",row.name=FALSE)