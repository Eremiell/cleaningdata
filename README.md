# Tidying UCI HAR Dataset
## Project for Getting and Cleaning Data

### Task

We were asked to:

* Operate on [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

* Produce R script doing: (citation from Assignment)

> You should create one R script called run_analysis.R that does the following.
> 
> 1. Merges the training and the test sets to create one data set.
> 2. Extracts only the measurements on the mean and standard deviation for each
> measurement.
> 3. Uses descriptive activity names to name the activities in the data set
> 4. Appropriately labels the data set with descriptive variable names.
> 5. Creates a second, independent tidy data set with the average of each
> variable for each activity and each subject.

* Produce this file and Code Book.

* Upload all of it to GitHub.

### Solution

I'll be discussing only the second part here, namely producing the R script.
The rest should be quite straightforward.

First of all, my script is not doing the required steps in order. There are two
main reasons for this:

1. Some of the steps are easier to do before/after certain other steps or the
steps after them might even undo them.
2. Even though the dataset is relatively small, especially reading took very
long time on my machine and used tons of memory.

I later changed the implementation and the reading became much faster and more
bearable, but for consistency, I left the original flow.

For these reasons, the steps are implemented roughly in this order:

1. Extracts only the measurements on the mean and standard deviation for each
measurement.
2. Merges the training and the test sets to create one data set.
3. Creates a second, independent tidy data set with the average of each
variable for each activity and each subject.
4. Uses descriptive activity names to name the activities in the data set
5. Appropriately labels the data set with descriptive variable names.

This should have no impact on results.

#### Input

Script checks whether all files are in place and if not, it downloads and
unzips the dataset.

#### Extracting the correct data

Even though the original dataset have just about 100MB, it took a lot of time
and memory on my machine to process it.

To fight this problem, I decided to subset the dataset on input rather than
later.

The contents of the dataset are described in files `features.txt` and
`features_info.txt`.

In `features_info.txt`, the dataset is described in kind of a code book.
There's bunch of measurements, most notably some of them processed by `mean()`
and `std()` functions. There are other means intermixed, most notably
`meanFreq()`, but the wording of the task seems to point towards the former
two.

The `features.txt` file contains names of all variables. I slightly processed
this file in a spreadsheet editor (LibreOffice Calc 4.3.0.4) and devised
numbers of columns containing measurements of `mean()` and `std()`. This
knowledge was used to build the `cutvector` array.

#### Merging the parts of the dataset

The main corpus of the data is splitted among files `X_test.txt` and
`X_train.txt`. The corpus is set in a way needed for machine learning, but
unfortunately not suiting well our needs.

Both files are read independently and subset using the same `cutvector`.

Metadata about subject and activity are read from files `subject_test.txt`,
`subject_train.txt`, `y_test.txt` and `y_train.txt` and prepended to the
tables.

Both parts are then combined together.

#### Projecting into the tidy set

Resulting table is then aggregated and mean of all variables is computed for
all combinations of subject and activity.

Data is then ordered by subject and activity.

#### Activity names

Activity names are read from `activity_labels.txt` and applied as factor labels
to the activity column.

#### Descriptive variable names

Variable names are read from `features.txt` and cut using aforementioned
`cutvector`.

Parenthesis are removed from the names, as it is known to cause problems in R.
Several names at the end of the list also have an error in the original code
book, having `Body` twice in their name. That problem is removed as well.

All data fields are also appended with `-mean` to note one extra averaging.

#### Output

The resulting dataset is written into `cleandata.txt` file without row numbers
and quoting.

Quoting in not needed for reading the data back into R and having quotes around
some fields (strings) and not around others (numbers) might cause problems,
while importing to spreadsheet editors or other software.

Consult [`CodeBook.md`](https://github.com/Eremiell/cleaningdata/blob/master/CodeBook.md)
for detailed description of contents of resulting dataset.

### See:

Bache, K. & Lichman, M. (2013).
[UCI Machine Learning Repository](http://archive.ics.uci.edu/ml). Irvine, CA:
University of California, School of Information and Computer Science.

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and
Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a
Multiclass Hardware-Friendly Support Vector Machine. International Workshop of
Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
