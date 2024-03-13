.PHONY: up stop restart volumes

up:
	docker-compose up -d 

stop:
	docker-compose down

restart: stop up

volumes:
	mkdir GITLAB_HOME GITLAB_HOME/data GITLAB_HOME/conf GITLAB_HOME/logs

apagar_volumes:
	sudo rm -R GITLAB_HOME --force

