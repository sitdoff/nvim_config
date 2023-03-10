#!/bin/bash
source ~/.local/share/nvim/mason/packages/flake8/venv/bin/activate
pip install flake8-bugbear pep8-naming flake8-import-order flake8-builtins flake8-quotes
deactivate
