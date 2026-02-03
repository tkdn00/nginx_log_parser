FROM ubuntu:22.04

RUN apt-get update && apt-get install git -y

COPY . .

RUN chmod +x parse.sh

ENTRYPOINT ["./parse.sh"]
