#!/bin/bash
# Create a new folder in the home directory
mkdir ~/myfolder
# Write "Hello" to file1 in the new folder
echo "Hello" > ~/myfolder/file1
# Append the current date to file1
date >> ~/myfolder/file1
# Create a new empty file2 in the new folder
touch ~/myfolder/file2
# Change permissions of file2 to be executable by all users
chmod 777 ~/myfolder/file2
# Generate a 20-character random string and write it to file3 in the new folder
openssl rand 20 > ~myfolder/file3
# Create new empty files file4 and file5 in the new folder
touch ~/myfolder/file4
touch ~/myfolder/file5

