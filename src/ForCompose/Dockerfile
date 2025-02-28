FROM nginx:1.23

USER root

RUN apt-get update && apt-get install -y \
gcc \
spawn-fcgi \
libfcgi-dev && \
apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /home

COPY nginx.conf /etc/nginx/nginx.conf
COPY hello.c .
COPY run.sh .

# RUN useradd -ms /bin/bash myuser
# USER myuser
RUN mkdir -p /var/cache/nginx/client_temp && \
    chmod -R 777 /var/cache/nginx

HEALTHCHECK --interval=30s --timeout=5s --retries=3 CMD curl -f http://localhost:81/ || exit 1

ENTRYPOINT [ "sh", "./run.sh" ]
