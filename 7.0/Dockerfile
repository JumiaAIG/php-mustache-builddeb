FROM marceloalmeida/php-docker:7.0

MAINTAINER Marcelo Almeida <marcelo.almeida@jumia.com>

WORKDIR "/root"

ENV DEBIAN_FRONTEND noninteractive

# INSTALL BUILDER DEPENDENCIES
RUN apt-get update && apt-get install -y --no-install-recommends \
  build-essential \
  checkinstall \
  g++ \
  git-core \
  libjson-c2 \
  libyaml-0-2 \
  libphp5-embed \
  make \
  php7.0-dev

COPY src /src

# INSTALL PACKAGES DEPENDENCIES
RUN mkdir /pkg
ADD https://github.com/marceloalmeida/libmustache4-builddeb/releases/download/v0.4.3/libmustache4_0.4.3-1_amd64.deb /root/
RUN dpkg -i /root/*.deb

# CREATE PACKAGE
ENV VERSION 0.7.3
RUN git clone git://github.com/jbboehr/php-mustache.git --recursive ;\
  cd php-mustache ;\
  cp -r /src/* /root/php-mustache/. ;\
  phpize ;\
  ./configure --enable-mustache ;\
  checkinstall -y --install=no --pkgname='php7.0-mustache' --pkgversion='$VERSION' --pkggroup='php' --pkgsource='https://github.com/jbboehr/php-mustache' --maintainer='Marcelo Almeida \<marcelo.almeida@jumia.com\>' --requires='php7.0-common \(\>= 7.0.7\), libc6 \(\>= 2.19), libgcc1 \(\>= 1:4.9.2\), libmustache4 \(\>= 0.4.3\), libstdc++6 \(\>= 1:4.9.2\)' --include=include_etc

VOLUME ["/pkg"]
