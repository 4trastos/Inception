all: setup
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml down

clean:
	@rm -rf /home/davgalle/data/mariadb/*
	@rm -rf /home/davgalle/data/wordpress/*
	@docker stop $$(docker ps -qa)
	@docker rm $$(docker ps -qa)
	@docker rmi $$(docker images -qa)
	@docker volume rm $$(docker volume ls -q)
	@docker network rm inception

setup:
	@mkdir -p /home/davgalle/data
	@mkdir -p /home/davgalle/data/mariadb
	@mkdir -p /home/davgalle/data/wordpress

.PHONY: all down clean setup

