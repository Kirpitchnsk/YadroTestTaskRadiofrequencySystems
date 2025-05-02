FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wget \
    python3 \
    python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY search_path.sh search_log.sh config.txt ./
RUN chmod +x search_path.sh search_log.sh
CMD ["/bin/bash"]