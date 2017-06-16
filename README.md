# Docker Alpine Shared Scripts

This repository contains scripts to install common (more complex) dependencies for Alpine based Docker images. 
Instead of using base image with specific dependency, you can use official image and install dependencies
in you final image.

Each script might have some build dependencies and may requires to set some ENV
variables in your Dockerfile. They are mentioned in header of each script. It's up
to you to install and remove build dependencies in you Dockerfile.

## Usage

### `install-glibc-v1.sh`

    FROM alpine:3.6
    ...    
    ENV LANG=C.UTF-8
    RUN wget -O - https://raw.githubusercontent.com/viliam-husar/docker-alpine-shared/master/install-glibc-v1.sh | sh \
    ...

### `install-oracle-java-se-jre-v1.sh`

    FROM alpine:3.6
    ...    
    ENV JAVA_HOME="/opt/java"
    RUN wget -O - https://raw.githubusercontent.com/viliam-husar/docker-alpine-shared/master/install-oracle-java-se-jre-v1.sh | sh \
    ...


