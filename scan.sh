#!/bin/bash

dt=$(date '+%d/%m/%Y %H:%M:%S');

echo ""

echo "Start scanning your Linux server - $dt"

echo ""

sleep 1s

echo "#####################################"
echo "Check all files changed in last 24h"
echo "#####################################
"

sudo find /var/www -name "*" ! -name "*.json" ! -name "sess_*" ! -name "*.log" ! -name "*.log.*" ! -name "*.ndb" ! -name "*.ldb" ! -name "*.hdb" ! -path "/var/www/cloud/public_html/data/*" ! -name "*.css" ! -name "*.png" ! -name "*.jpg" ! -name "*.jpeg" ! -name "*.gif" -cmin -1440 -type f

echo ""

echo "#####################################"
echo "Scan all changed files with Clamscan"
echo "#####################################
"

sudo find /var/www -name "*" ! -name "*.json" ! -name "sess_*" ! -name "*.log" ! -name "*.log.*" ! -name "*.ndb" ! -name "*.ldb" ! -name "*.hdb" ! -path "/var/www/cloud/public_html/data/*" ! -name "*.css" ! -name "*.png" ! -name "*.jpg" ! -name "*.jpeg" ! -name "*.gif" -cmin -1440 -type f > flist.txt && sleep 1s && clamscan -f flist.txt -i

echo ""

echo "#####################################"
echo "Checking if there is any sensitive data"
echo "#####################################
"

echo "[*] Scanning for log files"

find /var/www/ -name  "*.log" ! -name "license.txt" ! -name "readme.txt" -type f

echo ""

echo "[*] Scanning for ini files"

find /var/www/ -name  "*.ini" ! -name "license.txt" ! -name "readme.txt" -type f

echo ""

#echo "[*] Scanning for pdf files"

#find /var/www/ -iname '*.pdf' ! -path "/var/www/cloud/public_html/*"

#echo ""

echo "[*] Scanning for conf files"

lines=$(find /var/www/ -iname '*.conf' | wc -l)
if [ $lines -eq 0 ]; then
        echo " [-] No files found."
else
        find /var/www/ -iname '*.conf'
fi

echo ""

echo "[*] Scanning for cgi files"

lines=$(find /var/www/ -iname '*.cgi' | wc -l)
if [ $lines -eq 0 ]; then
        echo " [-] No files found."
else
        find /var/www/ -iname '*.cgi'
fi

echo ""

echo "[*] Scanning for cnf files"

lines=$(find /var/www/ -iname '*.cnf' | wc -l)
if [ $lines -eq 0 ]; then
        echo " [-] No files found."
else
        find /var/www/ -iname '*.cnf'
fi

echo ""

echo "[*] Scanning for xls files"

lines=$(find /var/www/ -iname '*.xls' | wc -l)
if [ $lines -eq 0 ]; then
        echo " [-] No files found."
else
        find /var/www/ -iname '*.xls'
fi

echo ""
