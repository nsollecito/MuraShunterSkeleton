
# Color helpers
C_CYAN=\x1b[34;01m
C_RESET=\x1b[0m

# Group targets
all: deps lint test
ci: lint test

# Install dependencies
deps:
	@echo "$(C_CYAN)> installing dependencies$(C_RESET)"
	@npm install

# Build resource manifest
build:
	@echo "$(C_CYAN)> building manifest$(C_RESET)"
	@./node_modules/.bin/shunter-build

# Run all linters
lint: jshint jscs dustmite

# Lint JavaScript
jshint:
	@echo "$(C_CYAN)> linting javascript$(C_RESET)"
	@./node_modules/.bin/jshint -e ejs .

# Run JavaScript Code Style
jscs:
	@echo "$(C_CYAN)> checking javascript code style$(C_RESET)"
	@./node_modules/.bin/jscs .

# Lint Dust Templates
dustmite:
	@echo "$(C_CYAN)> linting dust templates$(C_RESET)"
	@./node_modules/.bin/dustmite -r ./node_modules/shunter-mosaic/tests/server/dustmite/rules.js -p ./view

# Run all tests
test: test-server test-client

# Run unit tests
test-server:
	@echo "$(C_CYAN)> running server-side unit tests$(C_RESET)"
	@./node_modules/.bin/mocha --recursive --reporter spec --ui bdd ./tests/server

# Run client unit tests
test-client:
	@echo "$(C_CYAN)> running client-side unit tests$(C_RESET)"
	@./node_modules/.bin/shunter-test-client --resource-module=shunter-mosaic

.PHONY: test
