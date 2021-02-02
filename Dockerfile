FROM ubuntu:latest
RUN DEBIAN_FRONTEND="noninteractive" apt-get update && apt-get install -y git ssh

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
