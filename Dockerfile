FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    grep coreutils && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY *.sh *.txt ./
RUN chmod +x *.sh

ENTRYPOINT ["./search_log.sh"]