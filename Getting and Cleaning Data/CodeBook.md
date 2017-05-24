##Run_analysis.R data cleaning steps

The run_analysis.R script performs 5 key steps in data cleaning for the provided dataset:

1)Imports the required files from the working directory

2)Select which of the 561 measurements to utilize for further processing.  This script selects based upon the following commands:
	-grep and subset using "mean[^Freq]|std" to select the mean and standard deviaton of each of the 33 main measurements located in features_info.txt from the dataset
	 excluding the meanFreq measurement, and the 5 calculated global Means(differentiated in data by capital Mean)
	-sets variable names to lower case, replaces '-' with '.' for easier readability, and removes instances of () and duplicates of the word 'body' in variable names
	-List of variables as follows: 

[1] "subject"               "activity"              "tbodyacc.mean.x"       "tbodyacc.mean.y"       "tbodyacc.mean.z"       "tbodyacc.std.x"       
[7] "tbodyacc.std.y"        "tbodyacc.std.z"        "tgravityacc.mean.x"    "tgravityacc.mean.y"    "tgravityacc.mean.z"    "tgravityacc.std.x"    
[13] "tgravityacc.std.y"     "tgravityacc.std.z"     "tbodyaccjerk.mean.x"   "tbodyaccjerk.mean.y"   "tbodyaccjerk.mean.z"   "tbodyaccjerk.std.x"   
[19] "tbodyaccjerk.std.y"    "tbodyaccjerk.std.z"    "tbodygyro.mean.x"      "tbodygyro.mean.y"      "tbodygyro.mean.z"      "tbodygyro.std.x"      
[25] "tbodygyro.std.y"       "tbodygyro.std.z"       "tbodygyrojerk.mean.x"  "tbodygyrojerk.mean.y"  "tbodygyrojerk.mean.z"  "tbodygyrojerk.std.x"  
[31] "tbodygyrojerk.std.y"   "tbodygyrojerk.std.z"   "tbodyaccmag.mean"      "tbodyaccmag.std"       "tgravityaccmag.mean"   "tgravityaccmag.std"   
[37] "tbodyaccjerkmag.mean"  "tbodyaccjerkmag.std"   "tbodygyromag.mean"     "tbodygyromag.std"      "tbodygyrojerkmag.mean" "tbodygyrojerkmag.std" 
[43] "fbodyacc.mean.x"       "fbodyacc.mean.y"       "fbodyacc.mean.z"       "fbodyacc.std.x"        "fbodyacc.std.y"        "fbodyacc.std.z"       
[49] "fbodyaccjerk.mean.x"   "fbodyaccjerk.mean.y"   "fbodyaccjerk.mean.z"   "fbodyaccjerk.std.x"    "fbodyaccjerk.std.y"    "fbodyaccjerk.std.z"   
[55] "fbodygyro.mean.x"      "fbodygyro.mean.y"      "fbodygyro.mean.z"      "fbodygyro.std.x"       "fbodygyro.std.y"       "fbodygyro.std.z"      
[61] "fbodyaccmag.mean"      "fbodyaccmag.std"       "fbodyaccjerkmag.mean"  "fbodyaccjerkmag.std"   "fbodygyromag.mean"     "fbodygyromag.std"     
[67] "fbodygyrojerkmag.mean" "fbodygyrojerkmag.std" 

	-Minimal change in variable names from original, since they are highly descriptive in their current state.  Refer to dataset features_info.txt for more information on variables.

3)Activities renamed to all lower case, and replaced '_' with '.' for easier readability.

4)Combined X_train and X_test measurements, along with activity and subject information, into a single data frame, ordered by subject ID and activity, cached to local environment as fulldata

5)Calculate the mean of each measurement for each activity  and each subject, and print into a single data frame, cached to local environment as meandata