#Nginx Log Parser

##A simple Bash script that parses nginx access logs, converts selected fields into CSV format, and automatically stores the result in Git.

###Why this approach
* Positional parsing (awk) is used because the nginx access log format is known and stable
* Only key fields are extracted (IP, timestamp, HTTP method, URL + protocol, status), which is sufficient for basic log analysis
* Each run generates a new CSV file with a timestamp to avoid overwriting previous results
* The solution is intentionally simple and readable, without unnecessary complexity

###Run with Docker
####Build image
```
docker build -t nginx-log-parser .
```

####Run container
```
docker run -it -v ~/.gitconfig:/etc/gitconfig nginx-log-parser
```
####Notes
* The nginx.log file must be present in the project root
* After execution, a CSV file is created in the parsed_nginx directory
* The CSV file is automatically committed to Git if the directory is a Git repository
