## Coursera Getting and Cleaning Data Project ##
### Purpose: ###
The purpose of this project is to create two tidy datasets based on the dataset found at
`http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones` 
The first dataset produces only includes the values for the mean and standard deviation of each measurement.  All rows in the original dataset that were not the mean or standard deviation of one of the sensor values were removed from the dataset.  The columns describing the test subject as well as the activity during testing have been appended to the dataset.  The second dataset further processes this data by calculating the average value over each sensor reading for a particular subject, position and value type

### Use: ###
There is only one script involved with this dataset.  The filename is run_analysis.R.  For it to work properly, you will need to download the original dataset from this location. 
`https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip` 
and unzip it into a directory called UCI HAR Dataset.  The script should be placed in the same directory as the UCI HAR Dataset directory.  Open R, set your working directory to the directory that UCI HAR Dataset and the run_analysis.R script is located and then run the script.  It will generate a datafile called UCIHARFinalDataTidy.txt.  To load this file into R type the command
```R
df <- read.table("UCIHARFinalDataTidy.txt", headers = TRUE)
```

### Dataset: ###
Modifications to the original dataset are described in the CodeBook.md file in this github repository.

### Files: ###
run_analysis.R - The R file that processes the data
UCIHARFinalDataTidy - The final file produced with a Tidy dataset that includes the mean values calculated for each subject, activity and sensor reading type.

### Tidy Data ###
Both of the datasets that this script will create follow the Tidy Data principles as described in the paper written by Hadley Wickham which can be found here:
`https://www.jstatsoft.org/article/view/v059i10`

As described in this paper, the first dataset is of the tall form and the second is of the wide form.