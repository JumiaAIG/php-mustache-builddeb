FROM debian:stretch

MAINTAINER TechoOps <techops@jumia.com>

WORKDIR "/root"

ENV DEBIAN_FRONTEND noninteractive

# INSTALL BUILDER DEPENDENCIES
RUN apt-get update && apt-get install -y --no-install-recommends \
  build-essential \
  checkinstall \
  g++ \
  git-core \
  libjson-c3 \
  libyaml-0-2 \
  libphp7.0-embed \
  make \
  php7.0-dev

COPY src /src

# INSTALL PACKAGES DEPENDENCIES
RUN mkdir /pkg
ADD https://github.com/JumiaAIG/libmustache4-builddeb/releases/download/0.4.4/libmustache4_0.4.4-1_amd64.deb /root/
RUN dpkg -i /root/*.deb

# CREATE PACKAGE
ENV VERSION 0.7.4
RUN git clone git://github.com/jbboehr/php-mustache.git --recursive ;\
  cd php-mustache ;\
  cp -r /src/* /root/php-mustache/. ;\
  phpize ;\
  ./configure --enable-mustache ;\
  checkinstall -y --install=no --pkgname='php5-mustache' --pkgversion='$VERSION' --pkggroup='php' --pkgsource='https://github.com/jbboehr/php-mustache' --maintainer='TechOps \<techops@jumia.com\>' --requires='php7.0-common \(\>= 7.0.0\), libc6 \(\>= 2.19), libgcc1 \(\>= 1:4.9.2\), libmustache4 \(\>= 0.4.4\), libstdc++6 \(\>= 1:4.9.2\)' --include=include_etc

VOLUME ["/pkg"]
