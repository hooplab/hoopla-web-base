FROM evarga/jenkins-slave
MAINTAINER Halvor Granskogen Bjørnstad <halvor@hoopla.no>

# General utils:
RUN apt-get update && \
    apt-get -y install wget curl git

# Install python2.7 and python-pip
RUN apt-get update && \
    apt-get -y install python2.7 python-pip

# Install ruby 2.1.2
RUN apt-get -y update && \
    apt-get -y install build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev && \
    cd /tmp && \
    wget http://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p451.tar.gz && \
    tar -xvzf ruby-2.0.0-p451.tar.gz && \
    cd ruby-2.0.0-p451/ && \
    ./configure --prefix=/usr/local && \
    make && \
    make install

RUN gem install bundler
