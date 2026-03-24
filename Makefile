.PHONY: build up down shell rebuild logs

build:
	docker compose build

up:
	docker compose up -d

down:
	docker compose down

shell:
	docker compose exec kali bash

rebuild:
	docker compose build && docker compose up -d

logs:
	docker compose logs -f
