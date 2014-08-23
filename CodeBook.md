# Code Book
## of clean data derived from UCI HAR Dataset

### Factor variables

These variables categorize the data and give it context.

#### 1. subject

Unique identifier of subject which collected given data.

Integer having values 1-30

#### 2. activity

Activity subject was performing.

String having values:

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

### Processed measument results

These variables represent the data measured processed first by UCI and later by
me.

All names keep the format presented in UCI HAR Dataset for trackability. They
also seem to have quite good balance between readability and string length.

Parenthesis have been removed as they're known to cause problems in R.

Citing from UCI HAR Dataset code book regarding source and meaning of this data:

> The features selected for this database come from the accelerometer and
> gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain
> signals (prefix 't' to denote time) were captured at a constant rate of
> 50 Hz. Then they were filtered using a median filter and a 3rd order low pass
> Butterworth filter with a corner frequency of 20 Hz to remove noise.
> Similarly, the acceleration signal was then separated into body and gravity
> acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low
> pass Butterworth filter with a corner frequency of 0.3 Hz.
> 
> Subsequently, the body linear acceleration and angular velocity were
> derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and
> tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals
> were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag,
> tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).
> 
> Finally a Fast Fourier Transform (FFT) was applied to some of these signals
> producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag,
> fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain
> signals).
> 
> These signals were used to estimate variables of the feature vector for each
> pattern:
> 
> '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
> 
> ...
> 
> The set of variables that were estimated from these signals are: 
> 
> mean(): Mean value
> 
> std(): Standard deviation

Only data processed by `mean()` or `std()` in original dataset were projected
into this dataset.

As all the data was further averaged for each combination of subject and
activity, extra '-mean' was appended to each variable.

Data in this section is in order:

(Starting from the third column, markdown unfortunately don't reflect the order
numbers. See raw md for correct column numbers.)

3. tBodyAcc-mean-X-mean
4. tBodyAcc-mean-Y-mean
5. tBodyAcc-mean-Z-mean
6. tBodyAcc-std-X-mean
7. tBodyAcc-std-Y-mean
8. tBodyAcc-std-Z-mean
9. tGravityAcc-mean-X-mean
10. tGravityAcc-mean-Y-mean
11. tGravityAcc-mean-Z-mean
12. tGravityAcc-std-X-mean
13. tGravityAcc-std-Y-mean
14. tGravityAcc-std-Z-mean
15. tBodyAccJerk-mean-X-mean
16. tBodyAccJerk-mean-Y-mean
17. tBodyAccJerk-mean-Z-mean
18. tBodyAccJerk-std-X-mean
19. tBodyAccJerk-std-Y-mean
20. tBodyAccJerk-std-Z-mean
21. tBodyGyro-mean-X-mean
22. tBodyGyro-mean-Y-mean
23. tBodyGyro-mean-Z-mean
24. tBodyGyro-std-X-mean
25. tBodyGyro-std-Y-mean
26. tBodyGyro-std-Z-mean
27. tBodyGyroJerk-mean-X-mean
28. tBodyGyroJerk-mean-Y-mean
29. tBodyGyroJerk-mean-Z-mean
30. tBodyGyroJerk-std-X-mean
31. tBodyGyroJerk-std-Y-mean
32. tBodyGyroJerk-std-Z-mean
33. tBodyAccMag-mean-mean
34. tBodyAccMag-std-mean
35. tGravityAccMag-mean-mean
36. tGravityAccMag-std-mean
37. tBodyAccJerkMag-mean-mean
38. tBodyAccJerkMag-std-mean
39. tBodyGyroMag-mean-mean
40. tBodyGyroMag-std-mean
41. tBodyGyroJerkMag-mean-mean
42. tBodyGyroJerkMag-std-mean
43. fBodyAcc-mean-X-mean
44. fBodyAcc-mean-Y-mean
45. fBodyAcc-mean-Z-mean
46. fBodyAcc-std-X-mean
47. fBodyAcc-std-Y-mean
48. fBodyAcc-std-Z-mean
49. fBodyAccJerk-mean-X-mean
50. fBodyAccJerk-mean-Y-mean
51. fBodyAccJerk-mean-Z-mean
52. fBodyAccJerk-std-X-mean
53. fBodyAccJerk-std-Y-mean
54. fBodyAccJerk-std-Z-mean
55. fBodyGyro-mean-X-mean
56. fBodyGyro-mean-Y-mean
57. fBodyGyro-mean-Z-mean
58. fBodyGyro-std-X-mean
59. fBodyGyro-std-Y-mean
60. fBodyGyro-std-Z-mean
61. fBodyAccMag-mean-mean
62. fBodyAccMag-std-mean
63. fBodyAccJerkMag-mean-mean
64. fBodyAccJerkMag-std-mean
65. fBodyGyroMag-mean-mean
66. fBodyGyroMag-std-mean
67. fBodyGyroJerkMag-mean-mean
68. fBodyGyroJerkMag-std-mean

All variables in this section are double having values between -1 and 1

For details on how the data was manipulated, see
[`README.md`](https://github.com/Eremiell/cleaningdata/blob/master/README.md).

### See:

Bache, K. & Lichman, M. (2013).
[UCI Machine Learning Repository](http://archive.ics.uci.edu/ml). Irvine, CA:
University of California, School of Information and Computer Science.

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and
Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a
Multiclass Hardware-Friendly Support Vector Machine. International Workshop of
Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
