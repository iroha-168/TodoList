up:
	docker-compose -f ./docker/docker-compose.yml up -d
stop:
	docker-compose -f ./docker/docker-compose.yml stop
front:
	docker exec -it todo_frontend sh
build:
	docker-compose -f ./docker/docker-compose.yml build
