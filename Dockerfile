#
# Dockerfile for a base jmeter image
# 
# Usage:
# It is unlikely that you will need to run this image.
# It forms the basis for other images.
#

FROM ubuntu:14.04 
MAINTAINER Santosh Marigowda santosharakere@gmail.com 

# Describe the environment
ENV JDK_VERSION 1.7.0
ENV JMETER_VERSION 2.12

RUN apt-get update -y
RUN apt-get install curl -y

# Install the JDK
RUN  apt-get install openjdk-7-jdk -y

# Install JMeter
RUN cd /var/lib && \
  curl http://mirror.ox.ac.uk/sites/rsync.apache.org//jmeter/binaries/apache-jmeter-$JMETER_VERSION.tgz -o /var/lib/jmeter-$JMETER_VERSION.tgz && \
  tar xf jmeter-$JMETER_VERSION.tgz && \
  rm -f jmeter-$JMETER_VERSION.tgz
