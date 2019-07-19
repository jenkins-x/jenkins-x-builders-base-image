FROM ruby:2.5.1

ENV JQ_RELEASE_VERSION 1.5

RUN apt-get update && apt-get install -y \
  wget \
  bzip2 \
  python-pip \
  openjdk-8-jre && \
  pip install --upgrade pip anchorecli yamale && \
  wget https://github.com/stedolan/jq/releases/download/jq-${JQ_RELEASE_VERSION}/jq-linux64 && chmod +x jq-linux64 && mv jq-linux64 /usr/bin/jq && \
  apt-get install -y libappindicator1 fonts-liberation libasound2 libnspr4 libnss3 libxss1 lsb-release xdg-utils libappindicator3-1 && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg -i google-chrome*.deb && \
    rm google-chrome*.deb && \
    apt-get clean && \
    rm /var/lib/apt/lists/*
