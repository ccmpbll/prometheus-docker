#Using the official prometheus docker image as the base image.
#Wanted the ability to set the retention time and any other flags I might want to use later on.
FROM debian:latest
LABEL Name=prometheus-docker
LABEL maintainer="Chris Campbell"

ARG PROMETHEUS_VERSION="2.49.1"

RUN apt update && apt full-upgrade -y
RUN apt install -y wget
RUN apt clean all -y && apt autoremove -y

RUN wget https://github.com/prometheus/prometheus/releases/download/v${PROMETHEUS_VERSION}/prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz && \
    tar zxvf prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz
RUN mkdir -p /etc/prometheus && mkdir -p /prometheus && mkdir -p /usr/share/prometheus
RUN cp prometheus-${PROMETHEUS_VERSION}.linux-amd64/prometheus /bin/prometheus
RUN cp prometheus-${PROMETHEUS_VERSION}.linux-amd64/promtool /bin/promtool
RUN cp prometheus-${PROMETHEUS_VERSION}.linux-amd64/prometheus.yml /etc/prometheus/prometheus.yml
RUN cp -r prometheus-${PROMETHEUS_VERSION}.linux-amd64/console_libraries/ /usr/share/prometheus/
RUN cp -r prometheus-${PROMETHEUS_VERSION}.linux-amd64/consoles/ /usr/share/prometheus/
RUN cp prometheus-${PROMETHEUS_VERSION}.linux-amd64/LICENSE /LICENSE
RUN cp prometheus-${PROMETHEUS_VERSION}.linux-amd64/NOTICE /NOTICE
RUN ln -s /usr/share/prometheus/console_libraries /usr/share/prometheus/consoles/ /etc/prometheus/

ENV RETENTION_TIME=
#ENV UID=
#ENV GID=
#RUN chown -R ${UID:-nobody}:${GID:-nobody} /etc/prometheus /prometheus
#USER ${UID:-nobody}:${GID:-nobody}

EXPOSE 9090

VOLUME /prometheus

ENTRYPOINT exec /bin/prometheus \
--config.file=/etc/prometheus/prometheus.yml \
--storage.tsdb.path=/prometheus \
--web.console.libraries=/usr/share/prometheus/console_libraries \
--web.console.templates=/usr/share/prometheus/consoles \
--storage.tsdb.retention.time=${RETENTION_TIME:-15d}
