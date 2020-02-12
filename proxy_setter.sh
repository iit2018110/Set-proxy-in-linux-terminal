#!/bin/bash
protocols=(http https ftp socks)

cd 
cd /etc/apt

touch newfile.txt

echo "enter proxy : "
read proxy

echo "enter port : "
read port

echo "enter username : "
read username

echo "enter password -----Note: use %40 in place of @ (if any) : "
read -s password


for p in "${protocols[@]}"
do
	echo "Acquire::$p::proxy \"$p://$username:$password@$proxy:$port/\";" >> newfile.txt
done

sudo snap set system proxy.http="http://$proxy:$port"
sudo snap set system proxy.https="http://$proxy:$port"

cat newfile.txt > apt.conf

rm newfile.txt

echo "Yeah! proxy setup completed"

