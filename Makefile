DOCKER_FILE = srcs/docker-compose.yml

all		:	up

up		:
			docker-compose -f $(DOCKER_FILE) up -d --build

stop	:
			docker-compose -f $(DOCKER_FILE) stop

down	:
			docker-compose -f $(DOCKER_FILE) down

start	: up
			docker-compose -f $(DOCKER_FILE) start

clean	:  	down
			docker volume rm srcs_mariadb_data 
			docker volume rm srcs_wordpress_data 
			docker rmi srcs_nginx srcs_mariadb srcs_wordpress 

rm		:
			docker stop $$(docker ps -qa);\
			docker rm $$(docker ps -qa);\
			docker rmi -f $$(docker images -qa);\
			docker volume rm $$(docker volume ls -q);\
			docker network rm srcs_network_inception;\

ps		:
			docker-compose -f $(DOCKER_FILE) ps

re		:	stop up

.PHONY:		all up stop down start ps re