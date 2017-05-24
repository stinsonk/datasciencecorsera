##Run_analysis.R description

The R script run_analysis is designed to take the Human activity recognition using smartphones dataset (see source below), and run a basic cleaning process to calculate average data
for both the mean and standard deviation of the primary 33 measurements, for 6 activities, across 30 subjects.

The script requires as input files in the R working directory (located in the dataset .zip folder):
-features.txt
-activity_labels.txt
-X_train.txt
-y_train.txt
-X_test.txt
-y_test.txt
-subject_train.txt
-subject_test.txt

The script will output two dataframes: fulldata with 10299 observations of 68 variables (mean + standard deviation of 33 measurements, plus a column for subject ID and activity),
and meandata with the 180 observations of 68 variables, representing the mean of each variable, for each activity and subject.

Description of the variables and data cleaning steps can be found in CodeBook.md

Original Source Data:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones