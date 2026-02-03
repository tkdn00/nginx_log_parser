#!/bin/bash
NGINX_LOG_FILE="nginx.log"
PARSED_FOLDER="parsed_nginx"
CSV_FILE="$PARSED_FOLDER/nginx.csv"

mkdir -p "$PARSED_FOLDER"

if [[ ! -f "$NGINX_LOG_FILE" ]]; then
  exit 1
fi

echo "IP,Date,Method,URL_PROTOCOL,Status" > "$CSV_FILE"

awk -F' ' '{print $1 "," substr($4,2) " " substr($5,1,5) "," substr($6,2) "," $7 " " substr($8,1,8) "," $9}' "$NGINX_LOG_FILE" >> "$CSV_FILE"


if [ -d ".git" ]; then
    git add "$CSV_FILE"
    git commit -m "Parsed logs"
else
    echo "There is no git folder"
fi
