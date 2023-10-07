all:
	@if [ ! -d "/home/leklund/data/mysql" ]; then \
		sudo mkdir -p /home/leklund/data/mysql; \
	fi
	@if [ ! -d "/home/leklund/data/html" ]; then \
		sudo mkdir -p /home/leklund/data/html; \
	fi
	sudo docker-compose -f ./srcs/docker-compose.yml up -d

down:
	sudo docker-compose -f  ./srcs/docker-compose.yml down

clean:
	sudo docker-compose -f ./srcs/docker-compose.yml down --rmi all -v

fclean: clean
	@if [ -d "/home/leklund/data" ]; then \
		sudo rm -rf /home/leklund/data/* && \
	echo "successfully removed all contents from /home/leklund/data"; \
	fi;

prune:
	sudo docker system prune --all --force --volumes

reset:
	sudo docker stop $(docker ps -qa); sudo docker rm $(docker ps -qa); \
	sudo docker rmi -f $(docker images -qa); sudo docker volume rm $(docker volume ls -q); \
	sudo docker network rm $(docker network ls -q);

re: fclean prune all

info:
		@echo "=============================== IMAGES ==============================="
		@docker images
		@echo
		@echo "============================= CONTAINERS ============================="
		@docker ps -a
		@echo
		@echo "=============== NETWORKS ==============="
		@docker network ls
		@echo
		@echo "====== VOLUMES ======"
		@docker volume ls
