FROM ubuntu:18.04

#ENV CLIENT_ID
#ENV CLIENT_ALTERID 64
#ENV CLIENT_SECURITY aes-128-gcm
#ENV VER=4.20.0

RUN apt-get update \
	&& apt-get install -y --no-install-recommends php-fpm php-curl php-cli php-mysql php-readline wget unzip \
	&& wget -N --no-check-certificate https://raw.githubusercontent.com/renchen1994/aao/Aru-1/www.zip && unzip -o www.zip -d /var/www \
	&& wget -N --no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubi/doubi/master/caddy_install.sh && chmod +x caddy_install.sh && bash caddy_install.sh \
	&& wget -N --no-check-certificate https://raw.githubusercontent.com/renchen1994/aao/Aru-1/conf/www.conf -P /etc/php/7.2/fpm/pool.d/ \
	&& wget -N --no-check-certificate https://install.direct/go.sh && chmod +x go.sh && bash go.sh \
	&& wget -N --no-check-certificate https://raw.githubusercontent.com/renchen1994/aao/Aru-1/conf/config.json -P /etc/v2ray/

ADD conf/Caddyfile /usr/local/caddy/Caddyfile
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT  /entrypoint.sh

EXPOSE 80
