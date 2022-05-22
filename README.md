This script will scan all files that has been changed in last 24 hours by using -cmin -1440.

After that it will scan all changed files by using clamscan from filelist:

clamscan -f flist.txt -i
