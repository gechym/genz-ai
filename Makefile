.PHONY: run_all
run_all:
	poetry run honcho start

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

.PHONY: lint
lint:
	@echo "🚀 Poetry lock"
	poetry lock
	
	@echo "🚀 Checking poetry.lock file"
	poetry check --lock

	@echo "🚀 Fixing with ruff"
	poetry run ruff check --fix

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