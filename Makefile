D_COMPOSE_FILE = ./srcs/docker-compose.yml
DATA_DIR = /home/lsalmi/data/

all:
	@if [ ! -d "$(DATA_DIR)db" ]; then \
		echo "Creating $(DATA_DIR)db"; \
		mkdir -p $(DATA_DIR)db; \
	fi
	@if [ ! -d "$(DATA_DIR)wp" ]; then \
		echo "Creating $(DATA_DIR)wp"; \
		mkdir -p $(DATA_DIR)wp; \
	fi
	docker compose -f $(D_COMPOSE_FILE) up -d

start : 
	docker compose -f $(D_COMPOSE_FILE) start

stop : 
	docker compose -f $(D_COMPOSE_FILE) stop

down:
	docker compose -f $(D_COMPOSE_FILE) down

# stop running containers and remove all containers
# remove all Docker images, volumes and networks
reset:
	docker stop $$(docker ps -qa); docker rm $$(docker ps -qa); \
	docker rmi -f $$(docker images -qa); docker volume rm $$(docker volume ls -q); \
	docker network rm $$(docker network ls -q)

clean:
	docker compose -f $(D_COMPOSE_FILE) down --rmi all -v

fclean: clean
	@if [ ! -d "$(DATA_DIR)" ]; then \
		rm -rf $(DATA_DIR)* && \
		echo "Removed contents from $(DATA_DIR)"; \
	fi;

re: fclean all

info:
	@echo "* * * * * * * * * * * * IMAGES * * * * * * * * * * * * * * *"
	@docker images
	@echo
	@echo "* * * * * * * * * * * CONTAINERS * * * * * * * * * * * * * *"
	@docker ps -a
	@echo
	@echo " * * * * * * * * * * * NETWORKS * * * * * * * * * * * * * * "
	@docker network ls
	@echo
	@echo "* * * * * * * * * * * * VOLUMES * * * * * * * * * * * * * * "
	@docker volume ls
