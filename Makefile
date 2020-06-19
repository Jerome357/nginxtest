build: ##@Docker install services dependencies
	docker-compose -f infrastructure/docker/docker-compose-build.yml up --build

up: build ##@Docker Build and deploy services
	docker-compose -f infrastructure/docker/docker-compose-local.yml --project-name nginxtest up --build -d