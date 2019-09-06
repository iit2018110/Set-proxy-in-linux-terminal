#!/bin/bash
protocols=(http https ftp socks)

cd 
cd /etc/apt

touch newfile.txt

echo "enter proxy : "
read -n proxy

echo "enter port : "
read -n port

echo "enter username : "
read -n username

echo "enter password -----Note: use %40 in place of @ (if any) : "
read -n -s password


for p in "${protocols[@]}";
do
	echo "Acquire::$p::proxy \"$p://$username:$password@$proxy:$port/\";" >> newfile.txt
done

cat newfile.txt > apt.conf

rm newfile.txt

echo "Yeah! proxy setup completed"

