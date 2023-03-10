#!/bin/bash
cat <<EOT>> ./.flake8
[flake8]
ignore = W293, W391, E203
max-line-length = 120
inline-quotes = "
exclude = .git, __pycache__, env, venv, .venv
EOT
echo " "
echo "----------"
echo ".flake8 DONE"

cat <<EOT>> ./pyproject.toml
[tool.black]
line-length = 120
EOT
echo "pyproject.toml DONE"

cat <<EOT>> ./.gitignore
/env
/venv
/.venv
/myvenv
/__pycache__
.flake8
pyproject.toml
EOT
echo ".gitignore DONE"
echo "----------"
echo " "

