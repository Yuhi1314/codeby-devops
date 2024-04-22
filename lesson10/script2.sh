#!/bin/bash
cd ~/myfilder
ls -1 | wc -l
chmod 664 file2
find . -empty -exec rm {} +
sed -i '1!d' file1,file3

