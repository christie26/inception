NAME	= inception

all		:	up

re		: 	down up

up		:
			mkdir -p /home/yoonsele/data/wp
			mkdir -p /home/yoonsele/data/db
			cd srcs && docker compose build && docker compose up
down:
			cd srcs && docker compose down --volumes --rmi all
			sudo rm -rf ~/data

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
			sudo rm -rf ~//data

$(NAME) : 	all

.PHONY: 	all re up down clean
