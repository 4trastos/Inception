mkdir -p data
mkdir -p data/mariadb
mkdir -p data/wordpress

mkdir -p inception

touch inception/Makefile
mkdir -p inception/src

touch inception/src/.env
touch inception/src/docker-compose.yml
mkdir -p inception/src/requirements

mkdir -p inception/src/requirements/mariadb
mkdir -p inception/src/requirements/nginx
mkdir -p inception/src/requirements/wordpress

mkdir -p inception/src/requirements/mariadb/conf
mkdir -p inception/src/requirements/mariadb/tools
touch inception/src/requirements/mariadb/Dockerfile

mkdir -p inception/src/requirements/nginx/conf
touch inception/src/requirements/nginx/Dockerfile

mkdir -p inception/src/requirements/wordpress/conf
mkdir -p inception/src/requirements/wordpress/tools
touch inception/src/requirements/wordpress/Dockerfile
