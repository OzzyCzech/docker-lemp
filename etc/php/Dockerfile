FROM php:7.2-fpm

RUN apt-get update && apt-get install --no-install-recommends -y \
		apt-utils \
		libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libzip-dev \
    zip \
    libxml2-dev \
    icu-devtools \
		libicu-dev \
 && docker-php-ext-configure zip --with-libzip \
 && docker-php-ext-configure gd \
			--with-freetype-dir=/usr/include/ \
			--with-jpeg-dir=/usr/include/ \
			--with-png-dir=/usr/include/ \
 && docker-php-ext-install -j "$(nproc)" \
		gd \
		gettext \
		iconv \
		intl \
		json \
		mbstring \
		mysqli \
		pdo \
		pdo_mysql \
		simplexml \
		zip \
 && docker-php-ext-enable \
		gd \
		gettext \
		iconv \
		intl \
		json \
		mbstring \
		mysqli \
		pdo \
		pdo_mysql \
		simplexml \
		zip \
# Clean up
    && apt-get auto-remove \
    && apt-get clean