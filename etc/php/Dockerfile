FROM php:8-fpm

RUN apt -yqq update \
		&&  apt -yqq install \
			libfreetype6-dev \
			libjpeg62-turbo-dev \
	    libmcrypt-dev \
	    libpng-dev \
			libmemcached-dev \
			libwebp-dev \
			libxml2-dev \
			libzip-dev \
			libonig-dev \
			zlib1g-dev \
			msmtp msmtp-mta \
# Extensions
		&& docker-php-ext-install mysqli \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install opcache \
    && docker-php-ext-install simplexml \
	  && docker-php-ext-install iconv \
	  && docker-php-ext-install gd \
# Redis
		&& pecl install redis && docker-php-ext-enable redis \
# Memcached
#		&& pecl install memcached && docker-php-ext-enable memcached \
# Cleanup
    && docker-php-source delete

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# msmtp - sending emails locally wigh mailhog
COPY msmtprc.mailhog /etc/msmtprc
RUN chmod 600 /etc/msmtprc \
		&& touch /var/log/msmtp.log \
		&& chown www-data:www-data /etc/msmtprc \
		&& chown www-data:www-data /var/log/msmtp.log