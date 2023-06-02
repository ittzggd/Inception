# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hejang <hejang@student.42seoul.kr>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/02 12:34:46 by hejang            #+#    #+#              #
#    Updated: 2023/06/02 15:33:24 by hejang           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #



VOLUME_DB = ~/P/42/database/*
VOLUME_WP = ~/P/42/wordpress/*

all: 
	cd ${PWD}/srcs && \
	docker compose up --build -d

clean:
	cd ${PWD}/srcs && \
	docker compose down --rmi all

fclean: clean
	rm -rf $(VOLUME_DB)
	rm -rf $(VOLUME_WP)
	docker stop $$(docker ps -qa)
    docker system prune --all --force --volumes
	
re: fclean all

.PHONY: all clean fclean re

