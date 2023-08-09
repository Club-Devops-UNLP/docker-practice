## Services are [dolar_api, waifuland_fe_app, waifuland_be_app]
## Usage: make run_service service_type=hub service=dolar_api

COMPOSE_FILE_HUB := docker/hub.docker-compose.yml
COMPOSE_FILE_APPS := docker/apps.docker-compose.yml

env:
	cp ./docker/.env.example ./docker/.env

compose_up_hub:
	cd docker && docker compose -f hub.docker-compose.yml up -d

compose_up_apps:
	cd docker && docker compose -f apps.docker-compose.yml up -d

run_service:
	ifeq ($(service_type), hub)
		cd docker && docker-compose -f $(COMPOSE_FILE_HUB) run $(service)
	else ifeq ($(service_type), apps)
		cd docker && docker-compose -f $(COMPOSE_FILE_APPS) run $(service)
	else
		@echo "Invalid service_type. Use 'service_type=hub' or 'service_type=apps'."
		@exit 1
	endif
