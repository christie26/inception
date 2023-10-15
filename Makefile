NAME	= inception


all		:	re

build	:	
			cd srcs && docker-compose build --no-cache
re		: 
			cd srcs && docker-compose up --build

no-cache: 
			cd srcs && docker-compose up --build --no-cache
down	:	
			cd srcs && docker-compose down


$(NAME) : all