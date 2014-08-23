#!/usr/bin/Rscript

## Author: Jakub 'Eremiell' Marek
## Written: 2014/08/22

## Usage: "Rscript run_analysis.R"   (from bash)
##        "./run_analysis.R"         (from bash, with execute permission)
##        "source("run_analysis.R")" (from R)

## Refines UCI HAR Dataset by subsetting to just mean() and std() measurments,
## computing means of all variables for unique subject/activity pairs and
## annotating the resulting dataset.

## See README.md and CodeBook.md for details.

if (!(file.exists("UCI\ HAR\ Dataset/test/X_test.txt")
    & file.exists("UCI\ HAR\ Dataset/train/X_train.txt")
    & file.exists("UCI\ HAR\ Dataset/test/subject_test.txt")
    & file.exists("UCI\ HAR\ Dataset/test/y_test.txt")
    & file.exists("UCI\ HAR\ Dataset/train/subject_train.txt")
    & file.exists("UCI\ HAR\ Dataset/train/y_train.txt")
    & file.exists("UCI\ HAR\ Dataset/activity_labels.txt")
    & file.exists("UCI\ HAR\ Dataset/features.txt"))) {
	download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "UCI\ HAR\ Dataset.zip", "curl")
	unzip("UCI\ HAR\ Dataset.zip")
}

cutvector <- c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,
               253:254,266:271,345:350,424:429,503:504,516:517,529:530,542:543)

dt1 <- read.table("UCI\ HAR\ Dataset/test/X_test.txt")
dt2 <- read.table("UCI\ HAR\ Dataset/train/X_train.txt")

dt1 <- dt1[,cutvector]
dt2 <- dt2[,cutvector]

dt11 <- read.table("UCI\ HAR\ Dataset/test/subject_test.txt")
dt12 <- read.table("UCI\ HAR\ Dataset/test/y_test.txt")

dt21 <- read.table("UCI\ HAR\ Dataset/train/subject_train.txt")
dt22 <- read.table("UCI\ HAR\ Dataset/train/y_train.txt")

dt1 <- cbind(dt11, cbind(dt12, dt1))
dt2 <- cbind(dt21, cbind(dt22, dt2))

dt <- rbind(dt1, dt2)

dt <- aggregate(dt[,3:68], list(dt[,1], dt[,2]), mean)
dt <- dt[order(dt[,1], dt[,2]),]

lvls <- read.table("UCI\ HAR\ Dataset/activity_labels.txt")
dt[,2] <- t(t(factor(t(dt[,2]), levels=t(lvls[,1]), labels=t(lvls[,2]))))
cnames <- read.table("UCI\ HAR\ Dataset/features.txt", stringsAsFactors=FALSE)

cnames <- cnames[cutvector, 2]
cnames <- gsub("BodyBody", "Body", gsub("[()]", "", cnames))
cnames <- sapply(cnames, function(x) {paste(x, "-mean", sep="")})
cnames <- c("subject", "activity", cnames)

colnames(dt) <- cnames

write.table(dt, "cleandata.txt", row.names=FALSE, quote=FALSE)
