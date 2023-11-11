NAME	= inception

all		:	prune up

up	:	
			cd srcs && docker-compose up --build

stop:
			cd srcs && docker-compose down

prune: 		clean
			@ docker system prune -f

$(NAME) : all

.PHONY: 	all up stop prune