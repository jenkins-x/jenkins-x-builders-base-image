FROM ruby:2.5.1

ENV JQ_RELEASE_VERSION 1.5
ENV YQ_RELEASE_VERSION 2.4.1

RUN apt-get update && apt-get install -y \
  wget \
  bzip2 \
  python-pip \
  libappindicator1 \
  fonts-liberation \
  libasound2 \
  libnspr4 \
  libnss3 \
  libxss1 \
  lsb-release \
  xdg-utils \
  libappindicator3-1 \
  && pip install --upgrade pip anchorecli yamale \
  && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg -i google-chrome*.deb && \
    rm google-chrome*.deb && \
    apt-get clean \
  && rm /var/lib/apt/lists/* \
  && wget https://github.com/stedolan/jq/releases/download/jq-${JQ_RELEASE_VERSION}/jq-linux64 && mv jq-linux64 jq && chmod +x jq && mv jq /usr/bin/jq && \
    wget https://github.com/mikefarah/yq/releases/download/${YQ_RELEASE_VERSION}/yq_linux_amd64 && mv yq_linux_amd64 yq && chmod +x yq && mv yq /usr/bin/yq