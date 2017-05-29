# Buildtask for Couchbase driver for PHP

[![Build Status](https://travis-ci.org/marcelosousaalmeida/php-mustache-builddeb.svg?branch=master)](https://travis-ci.org/marcelosousaalmeida/php-mustache-builddeb)

Task to build Debian packages of Mustache library for PHP.


## Dependencies

* [libmustache4_0.4.2-1_amd64.deb](https://github.com/marcelosousaalmeida/libmustache4-builddeb/releases/download/v0.4.2/libmustache4_0.4.2-1_amd64.deb)

## Usage

```sh
$ docker-compose build
$ docker-compose run --rm builder
$ ls -1 pkg/
```

