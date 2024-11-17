all: setup
	@make setup
	@docker compose -f ./src/docker-compose.yml up -d --build

down:
	@docker compose -f ./src/docker-compose.yml down -v

clean:
	sudo rm -rf /home/davgalle/data/mariadb/*
	sudo rm -rf /home/davgalle/data/wordpress/*
	@if docker ps -qa | grep -q .; then docker stop $$(docker ps -qa); fi
	@if docker ps -qa | grep -q .; then docker rm $$(docker ps -qa); fi
	@if docker images -qa | grep -q .; then docker rmi $$(docker images -qa); fi
	@if docker volume ls -q | grep -q .; then docker volume rm $$(docker volume ls -q); fi
	@if docker network ls --filter name=inception -q | grep -q .; then docker network rm inception; fi

setup:
	@mkdir -p /home/davgalle/data
	@mkdir -p /home/davgalle/data/mariadb
	@mkdir -p /home/davgalle/data/wordpress

access_data:
	docker exec -it mariadb mysql -u root -p -e "USE wordpress; SELECT * FROM wp_users;"

.PHONY: all down clean setup

