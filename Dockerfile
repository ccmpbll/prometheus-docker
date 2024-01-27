#Using the official prometheus docker image as the base image.
#Wanted the ability to set the retention time and any other flags I might want to use later on.
FROM prom/prometheus:latest
LABEL Name=prometheus-docker
LABEL maintainer="Chris Campbell"

ENV RETENTION_TIME=

EXPOSE 9090

ENTRYPOINT exec /bin/prometheus \
--config.file=/etc/prometheus/prometheus.yml \
--storage.tsdb.path=/prometheus \
--web.console.libraries=/usr/share/prometheus/console_libraries \
--web.console.templates=/usr/share/prometheus/consoles \
--storage.tsdb.retention.time=${RETENTION_TIME:-15d}
