FROM ubuntu:16.04

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
    libpng-dev libjpeg-dev python libx11-dev libxext-dev && \
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub \
    | apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" \
    > /etc/apt/sources.list.d/google.list && \
    wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.3/install.sh | bash && \
    bash - && \
    . /root/.bashrc && \
    nvm install stable && \
    nvm alias default stable && \
    nvm use default && \
    apt-get install -y x11vnc xvfb

# Set up oh-my-zsh
RUN \
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh || true && \
    echo "export NVM_DIR=~/.nvm" >> ~/.zshrc && \
    echo "[ -s ~/.nvm/nvm.sh ] && . ~/.nvm/nvm.sh" >> ~/.zshrc

CMD ["/usr/bin/zsh"]
