## Repo for docker build

After clone you need to clone totum-mit into this repo and install `Composer`:

```
git clone https://github.com/totumonline/totum-mit.git

cd totum-mit

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

php composer-setup.php --quiet

rm composer-setup.php

php composer.phar install --no-dev
```


After that you can make build.

Totum on Docker Hub: https://hub.docker.com/r/totumonline/totum-mit