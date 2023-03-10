#!/bin/bash
cat <<EOT>> ./.flake8
[flake8]
ignore = W293, W391, E203
max-line-length = 120
inline-quotes = "
exclude = .git, __pycache__, env, venv, .venv
EOT
