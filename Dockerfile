FROM debian:8.5

MAINTAINER Riccardo Coppola <ricca509@gmail.com>

VOLUME ["/development"]

WORKDIR /development

ENV NVM_DIR         /root/.nvm
ENV NVM_BIN_DIR     /usr/local/nvm
ENV NODE_VERSION    6.3.1
ENV NVM_PATH        $NVM_DIR/versions/node/v$NODE_VERSION/lib/node
ENV NVM_BIN         $NVM_DIR/versions/node/v$NODE_VERSION/bin
ENV NODE_PATH       $NVM_BIN_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH            $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# Install packages
RUN \
    apt-get update && \
    apt-get install -y zsh git curl wget \
    build-essential perl \
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
    nvm install $NODE_VERSION && \
    nvm alias default $NODE_VERSION && \
    nvm use default

# Set up oh-my-zsh
RUN \
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh || true && \
    echo "export NVM_DIR=~/.nvm" >> ~/.zshrc && \
    echo "[ -s ~/.nvm/nvm.sh ] && . ~/.nvm/nvm.sh" >> ~/.zshrc

CMD /usr/bin/zsh
