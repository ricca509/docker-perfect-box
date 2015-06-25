FROM ubuntu:trusty

RUN apt-get update && apt-get install -y zsh git curl

RUN curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh || true

CMD ["/usr/bin/zsh"]
