FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# INSTALL SECTION

# install php, cron, psql and other soft

RUN apt-get update && apt-get -y install apt-utils software-properties-common wget && LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php && sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && apt-get update && apt-get -y install curl cron sudo unzip nginx php8.0 php8.0-fpm php8.0-bcmath php8.0-cli php8.0-curl php8.0-gd php8.0-mbstring php8.0-opcache php8.0-pgsql php8.0-xml php8.0-zip php8.0-soap certbot postgresql-14


# create user

RUN groupadd -g 201608 totum && adduser --uid 201608 --ingroup totum --disabled-password --no-create-home --gecos '' totum && adduser totum sudo && echo '%totum ALL=(ALL) NOPASSWD: /var/www/shell/root-entry.sh, /var/www/shell/root-stop.sh, /usr/bin/certbot' >> /etc/sudoers

# SETTINGS SECTION

# copy totum

COPY ./totum-mit /var/www/totum-mit

# copy entrypoint script

COPY ./shell /var/www/shell



# copy certbot

COPY ./certbot/acme /etc/nginx/acme

# Create work-file and change owner for file and Totum catalog

RUN touch /var/www/totum-work && chown -R totum:totum /var/www/totum-mit && chown totum:totum /var/www/totum-work && mkdir -p /var/www/html/.well-known/acme-challenge && rm /etc/nginx/sites-available/default && rm /etc/nginx/sites-enabled/default && touch /etc/nginx/sites-available/totum.online.conf && ln -s /etc/nginx/sites-available/totum.online.conf /etc/nginx/sites-enabled/totum.online.conf

# START SECTION

WORKDIR /var/www/totum-mit/

USER totum

ENTRYPOINT [ "/var/www/shell/docker-entrypoint.sh" ]

EXPOSE 80