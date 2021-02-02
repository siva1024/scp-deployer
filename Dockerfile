FROM ubuntu:latest
RUN apt-get update && apk-get install -y git openssh

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
