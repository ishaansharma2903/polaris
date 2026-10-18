# Scripts to help set up the Python environment and run checks before commits

.PHONY: setup test test-fast lint typecheck verify clean

setup:          ## Create venv, install package + dev deps, install pre-commit hooks
	python -m venv .venv
	.venv/bin/pip install -e ".[dev]"
	.venv/bin/pre-commit install
	.venv/bin/pre-commit install --hook-type commit-msg

test:           ## Full suite, including slow tests, with coverage
	.venv/bin/pytest -v --cov=src --cov-report=term-missing

test-fast:      ## Everything except slow-marked tests
	.venv/bin/pytest -v -m "not slow"

lint:           ## Static checks only, no tests
	.venv/bin/ruff check .
	.venv/bin/ruff format --check .
	.venv/bin/mypy src

verify: lint test  ## Run this before every push
	@echo "All local checks passed - safe to push."

clean:
	rm -rf .venv build dist *.egg-info .pytest_cache .mypy_cache .ruff_cache htmlcov .coverage
