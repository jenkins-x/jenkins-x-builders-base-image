FROM centos:7

RUN yum update  -y
RUN yum install -y epel-release && \
  yum install -y unzip \
  which \
  make \
  wget \
  zip \
  bzip2 \
  python-pip

RUN pip install anchorecli 

# chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm && \
  yum install -y google-chrome-stable_current_x86_64.rpm && \
  yum install -y Xvfb

# Set the locale(en_US.UTF-8)
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Git
RUN curl -f -o ./endpoint-repo-1.7-1.x86_64.rpm https://packages.endpoint.com/rhel/7/os/x86_64/endpoint-repo-1.7-1.x86_64.rpm && \
  rpm -Uvh endpoint-repo*rpm && \
  yum install -y git 

# java required for updatebot
RUN yum install -y java-1.8.0-openjdk-devel \
    java-1.8.0-openjdk-devel.i686

RUN yum -y groupinstall 'Development Tools'

ENV JQ_RELEASE_VERSION 1.5
RUN wget https://github.com/stedolan/jq/releases/download/jq-${JQ_RELEASE_VERSION}/jq-linux64 && mv jq-linux64 jq && chmod +x jq && cp jq /usr/bin/jq

