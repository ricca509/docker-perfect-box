FROM ubuntu:trusty

MAINTAINER Riccardo Coppola <ricca509@gmail.com>

VOLUME ["/development"]
WORKDIR /development

# Install packages
RUN \
    apt-get update && \
    apt-get install -y zsh git curl wget \
    build-essential ruby perl \
    libsqlite3-dev libfontconfig1-dev libicu-dev \
    libfreetype6 libssl-dev \
    libpng-dev libjpeg-dev python libX11-dev libxext-dev && \
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub \
    | apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" \
    > /etc/apt/sources.list.d/google.list && \
    curl -sL https://deb.nodesource.com/setup_iojs_2.x | \
    sudo bash - && \
    apt-get install -y x11vnc xvfb iojs google-chrome-stable

# Install node packages
RUN \
    npm install -g phantomjs grunt-cli gulp bower

# Set up oh-my-zsh
RUN \
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh || true

CMD ["/usr/bin/zsh"]
