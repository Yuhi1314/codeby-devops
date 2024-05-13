#!/bin/bash
# Change directory to the 'myfolder', return an error if unsuccessful
cd ~/myfolder || return
# Count the number of files in the current directory (excluding subdirectories)
num_files=$(find . -maxdepth 1 -type f | wc -l)
# Change the permission of file2 to 664
chmod 664 file2
# Remove any empty files in the current directory
find . -empty -exec rm {} +
# Delete all lines from file1 and file3 except the first line
sed -i '1!d' file1,file3
# Constants
FILE2_PERMISSION=664
EMPTY_FILES_MESSAGE="Removing empty files in current directory"
# Print message and number of files
echo "Number of files in the current directory: $num_files"
echo $EMPTY_FILES_MESSAGE
