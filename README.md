# prometheus-docker
![Image Build Status](https://img.shields.io/github/actions/workflow/status/ccmpbll/prometheus-docker/docker-image.yml?branch=main) ![Docker Image Size](https://img.shields.io/docker/image-size/ccmpbll/prometheus-docker/latest) ![Docker Pulls](https://img.shields.io/docker/pulls/ccmpbll/prometheus-docker.svg) ![License](https://img.shields.io/badge/License-GPLv3-blue.svg)

This is the Prometheus you already know and love, but with an easy way to configure the retention time for the data you collect. The default value for retention time is 15 days, but there is no way to change this in the config file. This value can only be set with a flag at startup. This image gives you the ability to configure the retention time with an environment variable and it gives the ability to add other startup flags if needed later on.

This image is built on top of the official Prometheus docker image, but with a few of my own tweaks. 

For more info on the storage related startup flags, see: [Prometheus Storage Documentation](https://prometheus.io/docs/prometheus/latest/storage/#operational-aspects)
