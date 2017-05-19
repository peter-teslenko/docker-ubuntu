FROM ubuntu:xenial-20170510
MAINTAINER smartchecker@gmail.com

# Ensure UTF-8 locale
COPY ./default_locale /etc/default/locale

RUN echo 'APT::Install-Recommends 0;' >> /etc/apt/apt.conf.d/01norecommends \
 && echo 'APT::Install-Suggests 0;' >> /etc/apt/apt.conf.d/01norecommends \
 && apt-get update \
 && apt-get -y upgrade \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y locales vim.tiny wget sudo net-tools ca-certificates unzip apt-transport-https apt-utils tzdata \
 && locale-gen en_US.UTF-8 \
 && locale-gen ru_RU.UTF-8 \
 && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales \
 && rm -rf /var/lib/apt/lists/*

# Set timezone
RUN ln -fs /usr/share/zoneinfo/Europe/Moscow /etc/localtime \
 && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure -f noninteractive tzdata

# Configure environment
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.en
