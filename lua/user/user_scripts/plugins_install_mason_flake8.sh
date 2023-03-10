#!/bin/bash
cd ~/.local/share/nvim/mason/packages/flake8
source venv/bin/activate
pip install flake8-bugbear pep8-naming
deactivate
