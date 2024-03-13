.PHONY: certs apagar_volumes up stop restart volumes apagar_volumes

HOST = base-producao.ufnt.edu.br
CA_PEM = ca.pem

certs:
	mkdir certs && openssl genrsa -out certs/ca.key 4096 && openssl req -new -x509 -key certs/ca.key -out certs/ca.crt -days 3650 -subj "/C=BR/ST=Tocantins/L=Araguaína/O=GitLab/OU=CA/CN=GitLab CA" && openssl req -new -key certs/ca.key -out certs/ca.csr -subj "/C=BR/ST=Tocantins/L=Araguaína/O=GitLab/OU=Server/CN=$(HOST)" && openssl x509 -req -in certs/ca.csr -CA certs/ca.crt -CAkey certs/ca.key -out certs/$(CA_PEM) -days 3650
apagar_volumes:
	rm -R certs

up:
	docker-compose up -d 

stop:
	docker-compose down

restart: stop up

volumes:
	mkdir GITLAB_HOME GITLAB_HOME/data GITLAB_HOME/conf GITLAB_HOME/logs

apagar_volumes:
	sudo rm -R GITLAB_HOME --force

