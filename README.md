# Development Docker Image

This README provides instructions for creating and running a Docker image for development purposes.

## Prerequisites

Ensure you have the following installed:
- [Docker](https://www.docker.com/get-started)

## Base Image and PHP Extensions

The development Docker image is based on `php:8.3-fpm` and includes the following PHP extensions:

- iconv
- zip
- intl
- opcache
- soap
- gd
- imagick
- apcu
- redis
- pdo
- pdo_pgsql
- xdebug
- excimer

Additionally, it includes:

- Symfony CLI
- `PHP_SECURITY_CHECKER`
- ffmpeg
