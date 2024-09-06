FROM almalinux:9

LABEL org.opencontainers.image.source=https://github.com/VykeZaark/erlang-builder

RUN yum makecache && yum install -y epel-release && yum install -y \
  autoconf \
  gcc \
  gcc-c++ \
  m4 \
  mercurial \
  openssl-devel \
  ncurses-devel \
  tar \
  wget \
  zlib-devel \
  make \
  which \
  rpm-build \
  git

RUN wget -O otp.rpm https://github.com/rabbitmq/erlang-rpm/releases/download/v26.2.5.3/erlang-26.2.5.3-1.el9.x86_64.rpm && \
    rpm -ivh otp.rpm && rm otp.rpm

RUN wget https://github.com/erlang/rebar3/releases/download/3.24.0/rebar3 && mv rebar3 /usr/bin && chmod +x /usr/bin/rebar3

ENV PATH="/usr/bin:${PATH}"

RUN mkdir /build
