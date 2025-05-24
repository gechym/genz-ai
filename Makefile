.PHONY: run_all
run_all:
	poetry run honcho start

# .PHONY: run_api
# run_api:
# 	 export PYTHONPATH=./ && poetry run python server/main.py

# .PHONY: run_web
# run_web:
# 	export PYTHONPATH=./ && adk web --port 8080 --session_db_url=sqlite:///./database_session.db

# .PHONY: run_celery
# run_celery:
# 	export PYTHONPATH=./ && python server/start_celery.py

.PHONY: install
install:
	@echo "🚀 Installing environment"
	poetry lock
	poetry install
	poetry install --with dev
	poetry install --with test

.PHONY: fix
fix:
	@echo "🚀 Fixing with ruff"
	poetry run ruff check --fix

.PHONY: format
format:
	@echo "🚀 Formatting with ruff"
	poetry run ruff format

.PHONY: lint
lint:
	@echo "🚀 Fixing with ruff"
	poetry run ruff check --fix
	@echo "🚀 Checking poetry.lock file"
	poetry check --lock
	@echo "🚀 Linting with ruff"
	poetry run ruff check
	@echo "🚀 Linting with pylint"
	poetry run pylint ./
	@echo "🚀 Checking with mypy"
	poetry run mypy ./
	@echo "🟢 All checks have passed"
	
	@echo "Clear cache"
	make clean

.PHONY: clean
clean:
	find . -type f -name "*.py[co]" -delete
	find . -type d -name "__pycache__" -delete
	find . | grep -E '(\.mypy_cache|\.ruff_cache|__pycache__|\.pyc|\.pyo$$)' | xargs rm -rf