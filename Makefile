NAME	= inception

all		:	up

re		: 	down up

up		:	
			cd srcs && sudo docker compose up --build

down:
			cd srcs && sudo docker compose down --volumes --rmi all
			rm -rf ~/yoonsele/data

clean:
			@if [ $$(docker ps -q | wc -l) -gt 0 ]; then \
				echo "Stopping running containers..."; \
				docker stop $$(docker ps -q); \
			else \
				echo "No running containers found."; \
			fi
			@if [ $$(docker ps -aq | wc -l) -gt 0 ]; then \
				echo "Removing containers..."; \
				docker rm $$(docker ps -aq); \
			else \
				echo "No containers found."; \
			fi
			@if [ $$(docker images -aq | wc -l) -gt 0 ]; then \
				echo "Removing images..."; \
				docker rmi $$(docker images -aq); \
			else \
				echo "No images found."; \
			fi
			docker system prune -f
			rm -rf ~/yoonsele/data

$(NAME) : 	all

.PHONY: 	all re up down clean