After clone you need to clone totum-mit into this repo:

git clone https://github.com/totumonline/totum-mit.git


And create .dockerignore:

totum-mit/.git
totum-mit/.gitignore
totum-mit/.gitattributes
totum-mit/composer.phar
totum-mit/Conf.php.default
totum-mit/http/fls/
totum-mit/http/.htaccess

After that you can make build.

Totum on Docker Hub: https://hub.docker.com/r/ttmonline/totum-mit