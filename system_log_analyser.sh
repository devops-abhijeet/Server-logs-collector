#!/bin/bash

# Author : Abhijeet K
# Reason : Daily Log monitoring and keeping records

# Get Server IP
DB_HOST="10.251.251.5" 
DB_DB="servers"
DB_TABLE="server_logs"
DB_USER="root"
DB_PASSWORD="abhi1407"

ip_add=$(hostname -I | awk '{print $1}')
host=$(hostname)
log_store="/tmp/logs.log"

FILES=("/var/log/messages" "/var/log/dmesg" "/var/log/syslog" "/var/log/kern.log" "/var/log/dpkg.log")

keyword=("error" "oom" "out of memory" "fail" "fatal" "timeout")

if [[ ! -f "$log_store" ]];then
	touch $log_store
fi

for file in "${FILES[@]}"
do
	if [[ -f "$file" ]];
	then
		echo "Scaning in file $file"
		for key in "${keyword[@]}"
		do
			echo "Scanning for $key"
			grep -i "$key" "$file" | tail -n 10 >> "$log_store"
		done
	fi
done	

#Fetching data
data=$(cat $log_store)

check_db=$(mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASSWORD" -e "show databases" | grep -i "$DB_DB")

if [[ -n "$check_db" ]];then
	:
else
	mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASSWORD" -e "create database $DB_DB"

fi

echo "$check_db"

check_table=$(mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASSWORD" "$DB_DB" -e "show tables" | grep -i "$DB_TABLE")

if [[ -n "$check_table" ]];then
	:
else
	mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASSWORD" "$DB_DB" -e "CREATE TABLE IF NOT EXISTS $DB_TABLE (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ip_address VARCHAR(50) NOT NULL,
    hostname VARCHAR(100) NOT NULL,
    log_data VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);"
fi

mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASSWORD" "$DB_DB" -e "INSERT INTO $DB_TABLE (ip_address, hostname, log_data) VALUES ('$ip_add', '$host', '$data');"

