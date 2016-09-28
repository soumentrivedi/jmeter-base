#
# Dockerfile for a base jmeter image
# 
# Usage:
# It forms the basis for other images

#

FROM ubuntu:14.04 
MAINTAINER Souman Trivedi soumen.trivedi@gmail.com 

# Describe the environment
ENV JDK_VERSION 1.7.0
ENV JMETER_VERSION 3.0

# Install the JDK
RUN apt-get update -y && apt-get install curl openjdk-7-jdk -y && cd /var/lib && \
  curl http://mirror.ox.ac.uk/sites/rsync.apache.org/jmeter/binaries/apache-jmeter-$JMETER_VERSION.tgz -o /var/lib/jmeter-$JMETER_VERSION.tgz && \
  tar xf jmeter-$JMETER_VERSION.tgz && \
  rm -f jmeter-$JMETER_VERSION.tgz && \
  ln -s /var/lib/apache-jmeter-2.13 /var/lib/apache-jmeter

ENTRYPOINT /bin/sh
