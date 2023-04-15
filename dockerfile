FROM python:3.12-rc-bullseye

RUN apt update -y && apt-get install -y software-properties-common && \
    apt-add-repository 'deb http://security.debian.org/debian-security stretch/updates main' && apt update -y && \
    apt-get install -y openjdk-8-jdk-headless && \
    export JAVA_HOME && \
    apt-get clean

COPY requirements_client.txt /worker_data/clients/requirements.txt
RUN pip install -r /worker_data/clients/requirements.txt
