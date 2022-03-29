#!/usr/bin/env bash

sudo /var/www/shell/root-entry.sh

bin/totum schemas-update

trap "sudo /var/www/shell/root-stop.sh; exit" SIGINT SIGTERM

tail -f /var/www/totum-work & wait $!