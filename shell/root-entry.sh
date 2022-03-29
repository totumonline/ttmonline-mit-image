#!/usr/bin/env bash

sudo -u root cron

sudo -u root cat /var/www/cron/totum_cron | crontab -u totum -

sudo -u root service php8.0-fpm start

sudo -u root service nginx start

