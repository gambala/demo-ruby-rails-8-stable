CONTAINER_NAME=demo-ruby-rails-8-stable
PORT=3000
ID_FILE=.container_id

dev:
	bin/dev

docker-build:
	docker build -t $(CONTAINER_NAME) .

docker-run:
	@echo "Running Docker container..."
	@docker run -p $(PORT):$(PORT) $(CONTAINER_NAME)

docker-rund:
	@echo "Running Docker container..."
	@docker run -dp $(PORT):$(PORT) $(CONTAINER_NAME) > $(ID_FILE)
	@echo "Container started: $$(cat $(ID_FILE))"

docker-stopd:
	@if [ -f $(ID_FILE) ]; then \
		CONTAINER_ID=$$(cat $(ID_FILE)); \
		echo "Stopping Docker container: $$CONTAINER_ID"; \
		docker stop $$CONTAINER_ID; \
		rm $(ID_FILE); \
		echo "Container stopped."; \
	else \
		echo "No container ID file found. Is the container running?"; \
	fi
