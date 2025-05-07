#!/bin/bash

# Author : Abhijeet K
# Reason : Daily Log monitoring and keeping records

# Defining database credentilas from file credentials.ini file 
DB_HOST=$(awk -F= '/DB_HOST=/ {print $2}' credentials.ini) 
DB_DB=$(awk -F= '/DB_DB=/ {print $2}' credentials.ini)
DB_TABLE=$(awk -F= '/DB_TABLE=/ {print $2}' credentials.ini)
DB_USER=$(awk -F= '/DB_USER=/ {print $2}' credentials.ini)
DB_PASSWORD=$(awk -F= '/DB_PASSWORD=/ {print $2}' credentials.ini)

#Extracting IP & Hostname of server and storing into varibles
ip_add=$(hostname -I | awk '{print $1}')
host=$(hostname)

#Defining Log file in which error logs will be redirected
log_store="/tmp/logs.log"

#Common default server log files 
FILES=("/var/log/messages" "/var/log/dmesg" "/var/log/syslog" "/var/log/kern.log" "/var/log/dpkg.log")

#Defining some keywords to get collect logs 
keyword=("error" "oom" "out of memory" "fail" "fatal" "timeout")

#Checking file exist or not
if [[ ! -f "$log_store" ]];then
	touch $log_store
fi

#Checking logs in files as per keywords and storing it into file
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

#storing log file data into new variable
data=$(cat $log_store)

#Checking if DB is exist or not and not present then creating it 
check_db=$(mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASSWORD" -e "show databases" | grep -i "$DB_DB")

if [[ -n "$check_db" ]];then
	:
else
	mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASSWORD" -e "create database $DB_DB"

fi


#Checking if Table is exist or not and if not then creating it
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

#Inserting Data into table 
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASSWORD" "$DB_DB" -e "INSERT INTO $DB_TABLE (ip_address, hostname, log_data) VALUES ('$ip_add', '$host', '$data');"

