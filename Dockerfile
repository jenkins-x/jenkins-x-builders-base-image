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
ENV GIT_VERSION 2.21.0
RUN yum install -y curl-devel expat-devel gettext-devel openssl-devel zlib-devel && \
  yum install -y gcc perl-ExtUtils-MakeMaker && \
  cd /usr/src  && \
  wget https://www.kernel.org/pub/software/scm/git/git-${GIT_VERSION}.tar.gz  && \
  tar xzf git-2.21.0.tar.gz  && \
  cd git-2.21.0 && \
  make prefix=/usr/local/git all  && \
  make prefix=/usr/local/git install

ENV PATH /usr/local/git/bin:$PATH

RUN yum -y groupinstall 'Development Tools'
RUN yum remove -y git

ENV JQ_RELEASE_VERSION 1.5
RUN wget https://github.com/stedolan/jq/releases/download/jq-${JQ_RELEASE_VERSION}/jq-linux64 && mv jq-linux64 jq && chmod +x jq && cp jq /usr/bin/jq

RUN yum clean all
