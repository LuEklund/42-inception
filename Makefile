all:
	@if [ ! -d "/var/leklund/data/mysql" ]; then \
		sudo mkdir -p /var/leklund/data/mysql; \
	fi
	@if [ ! -d "/var/leklund/data/html" ]; then \
		sudo mkdir -p /var/leklund/data/html; \
	fi
	sudo docker-compose -f ./srcs/docker-compose.yml up -d

down:
	sudo docker-compose -f  ./srcs/docker-compose.yml down

clean:
	sudo docker-compose -f ./srcs/docker-compose.yml down --rmi all -v

fclean: clean
	@if [ -d "/var/leklund/data" ]; then \
	sudo rm -rf /var/leklund/data/* && \
	echo "successfully removed all contents from /var/leklund/data"; \
	fi;

re: fclean all

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
