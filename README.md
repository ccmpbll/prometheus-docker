# prometheus-docker
![Image Build Status](https://img.shields.io/github/actions/workflow/status/ccmpbll/prometheus-docker/docker-image.yml?branch=main) ![Docker Image Size](https://img.shields.io/docker/image-size/ccmpbll/prometheus-docker/latest) ![Docker Pulls](https://img.shields.io/docker/pulls/ccmpbll/prometheus-docker.svg) ![License](https://img.shields.io/badge/License-GPLv3-blue.svg)

This is the Prometheus you already know and love, but with an easy way to configure the retention time for the data you collect. The default value for retention time is 15 days, but there is no way to change this in the config file. This value can only be set with a flag at startup. This image allows you to configure the retention time using an environment variable and allows for other startup flags to be added later if needed.

For more info on the storage related startup flags, see: [Prometheus Storage Documentation](https://prometheus.io/docs/prometheus/latest/storage/#operational-aspects)

#### Available Settings:

Config Directory: Volume that will be mapped to /etc/prometheus and contains the prometheus.yml config file. 

Data Directory: Volume that will be mapped to /prometheus and will be used to store the data you collect.

Port: Default listening port is 9090

RETENTION_TIME: This environment variable is used to configure how long Prometheus will retain your collected metrics. Default is 15d. Units Supported: y, w, d, h, m, s, ms.

#### Example:
```
docker run -d --name=prometheus-docker \
-v /path/to/config/dir:/etc/prometheus \
-v /path/to/data/dir:/prometheus \
-p 9090:9090/tcp
-e RETENTION_TIME='30d' \
ccmpbll/prometheus-docker:latest
```
