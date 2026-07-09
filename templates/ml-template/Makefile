.PHONY: install train evaluate predict test clean

install:
	uv sync

train:
	python scripts/train.py

evaluate:
	python scripts/evaluate.py

predict:
	python scripts/predict.py

test:
	pytest

clean:
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type d -name ".pytest_cache" -exec rm -rf {} +
	find . -type d -name ".ipynb_checkpoints" -exec rm -rf {} +