# Use an official Ubuntu image as the base
FROM ubuntu:20.04

# Set environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV SPARK_HOME=/opt/spark
ENV PATH=$PATH:$SPARK_HOME/bin
ENV PATH=$PATH:$SPARK_HOME/bin
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && \
    apt-get install -y dnsutils openjdk-8-jdk python3 python3-pip wget && \
    pip3 install pyspark pandas pytest boto3

# Download and extract Spark
WORKDIR /opt

RUN wget https://downloads.apache.org/spark/spark-3.4.1/spark-3.4.1-bin-hadoop3.tgz && \
    tar -xzf spark-3.4.1-bin-hadoop3.tgz && \
    mv spark-3.4.1-bin-hadoop3 spark && \
    rm spark-3.4.1-bin-hadoop3.tgz

# Set working directory
WORKDIR /app
