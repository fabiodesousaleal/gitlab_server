.PHONY: up stop restart

up:
	docker-compose up -d 

stop:
	docker-compose down

restart: stop up

