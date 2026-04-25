.PHONY: install venv

install: venv
	.venv/bin/python -m pip install --upgrade pip setuptools wheel
	.venv/bin/python -m pip install -r requirements.txt

venv:
	python3 -m venv .venv

clean:
	rm -rf .venv __pycache__ build dist *.egg-info
