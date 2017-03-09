## CodeBook for Mean Value of Sensor Data ##

### Raw Data ###
The raw data for this assignment is based off of the UCI HAR dataset of Accelerometer data for 30 people with a Samsung Galaxy S smartphone strapped near their waist.

The data files were distributed as a zip file that can be found here:
` https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip `

The CodeBook describing this data can be found here:
` http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones `

The raw data included many observations that were excluded from consideration.  The only fields we were interested in were the average values (field descriptor ends in -mean()) and the standard deviation values (field descriptor ends in -std()).  The raw values in each of the Inertial folders was also discarded because it didn't have anything to do with the mean or standard deviation.

There are two folders with the data we need, test and train.  Each of these folders contain three files that are important.  The X_ file contains the raw data readings as a grid of .  The y_ file contains the activity encoded as numbers being performed during the sampling and finally the subject_ file contains the subject being sampled during the activity encoded as numbers.  The activity_labels.txt file contains the names of the activities along with their code value.  The features.txt file includes the descriptors of each of the variables in the table.  For a more detailed description of the original data please see the features_info.txt file included in the zip file.

### Data Load and Transformation ###
All of the data files included in this data set are fixed format text files.

1. Test Data
  1. Load the features.txt file to be used as column headers
  1. Load the testdata file
  1. Load the test subject data
  1. Load the test activity data
  1. Remove the unneeded columns using a regular expression that looks for "-std()" or "-mean()"
  1. Merge the test data, the subject column and the activity column
1. Train data
  1. Load the traindata file
  1. Load the train subject data
  1. Load the train activity data
  1. Remove the unneeded columns using a regular expression that looks for "-std()" or "-mean()"
  1. Merge the train data, the subject column and the activity column
1. Process the combined data file and create the first dataset
  1. Combine the test data and train data into one dataset
  1. Load the activities dataset into memory
  1. Change the labels of the coded activity values to be the text label
  1. This completes creation of the first dataset.
1. Create the second data set and write to a file
  1. To create the second we take the dataset we just created and take the mean of each feature for a specific activity for a specific subject and put this data into a table.
  1. The Activity labels are reapplied
  1. The final output is written to the file UCIHARFinalDataTidy.txt

### Output Format ###
There are 181 rows and 69 columns in the output file.  The first row is column titles and the first column is row titles.  The dataset itself is made up of first, the encoded subject ID followed by the descriptor for the activity being performed.  The following 66 columns are the actual data.  All are numeric and are between -1 and 1.  Each value is separated by a space.  To load this data file into R, use this command: `read.table("UCIHARFinalDataTidy.txt", header = TRUE)`
