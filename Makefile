.PHONY: dev init

# Build and run Ohara from source with compose.dev.yml, rebuilding on code changes. Reads OHARA_URL from .env.
dev:
	docker compose -f compose.dev.yml up --build --watch

# Start over from a fresh install: removes the container, the image, and the data volume (settings, sessions, docs).
init:
	docker compose -f compose.dev.yml down --volumes --rmi local --remove-orphans
	@echo "Data removed. Setup creates a new GitHub App: delete the old one in GitHub > Settings > Developer settings > GitHub Apps."
	$(MAKE) dev
