## START_MAKEFILE ##

#==========================NAMES=========================#

DK		=	docker

NAMEIM	=	ft_server

NAMECON	=	ft_server_kjaco

RELOAD	=	docker exec -it ft_server_kjaco nginx -s reload

#==========================RULES=========================#

all:	build
		${DK} run -d --rm -p 80:80 -p 443:443 --name ${NAMECON} ${NAMEIM}

build:
		${DK} build . --tag ${NAMEIM}

clean:
		${DK} system prune -a -f

stop:
		${DK} stop ${NAMECON}

autoindex_on:
		${DK} exec -it ${NAMECON} sed -i 's|autoindex off|autoindex on|' /etc/nginx/sites-available/default
		${RELOAD}

autoindex_off:
		${DK} exec -it ${NAMECON} sed -i 's|autoindex on|autoindex off|' /etc/nginx/sites-available/default
		${RELOAD}
