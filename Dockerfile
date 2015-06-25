FROM ubuntu:trusty

MAINTAINER Riccardo Coppola <ricca509@gmail.com>

# Install packages
RUN \
    apt-get update && \
    apt-get install -y zsh git curl \
    ruby perl \
    libsqlite3-dev libfontconfig1-dev libicu-dev \
    libfreetype6 libssl-dev \
    libpng-dev libjpeg-dev python libX11-dev libxext-dev && \
    curl -sL https://deb.nodesource.com/setup_iojs_2.x | \
    sudo bash - && \
    apt-get install -y iojs

RUN \
    npm install -g phantomjs grunt-cli gulp

# Set up oh-my-zsh
RUN \
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh || true

CMD ["/usr/bin/zsh"]
