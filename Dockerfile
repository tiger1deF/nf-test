# Use an official base image with Linux OS
FROM ubuntu:latest

# Update and install required packages
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y openjdk-11-jre-headless wget python3-pip

# Install Nextflow
RUN wget -qO- https://get.nextflow.io | bash
RUN mv nextflow /usr/local/bin

# Install Polars and proteinTools using pip
RUN pip3 install polars proteinTools

# Set up a working directory for your application
WORKDIR .
