FROM ubuntu:trusty

# Install basic packages
RUN apt-get update && apt-get install -y zsh git curl

# Set up oh-my-zsh
RUN curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh || true

# Install io.js
RUN curl -sL https://deb.nodesource.com/setup_iojs_2.x | sudo bash - && \
apt-get install -y iojs

CMD ["/usr/bin/zsh"]
