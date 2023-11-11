NAME	= inception

all		:	up

re		: 	prune up

up		:	
			cd srcs && docker-compose up --build

stop:
			cd srcs && docker-compose down

prune: 		
			docker system prune -f

$(NAME) : all

.PHONY: 	all re up stop prune