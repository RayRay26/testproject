#!/usr/bin/env bash
set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENV_DIR="${PROJECT_ROOT}/.venv"
PYTHON_BIN="${PYTHON_BIN:-python3}"
VENV_ACTIVATE="$VENV_DIR/bin/activate"

if ! command -v "$PYTHON_BIN" >/dev/null 2>&1; then
  echo "Error: '$PYTHON_BIN' is not installed or not on PATH." >&2
  exit 1
fi

echo "Using Python: $PYTHON_BIN"

if [ -d "$VENV_DIR" ]; then
  if [ ! -f "$VENV_ACTIVATE" ]; then
    echo "Existing virtual environment at $VENV_DIR is incomplete. Recreating it."
    rm -rf "$VENV_DIR"
    echo "Creating virtual environment at $VENV_DIR"
    "$PYTHON_BIN" -m venv "$VENV_DIR"
  else
    echo "Virtual environment already exists at $VENV_DIR"
  fi
else
  echo "Creating virtual environment at $VENV_DIR"
  "$PYTHON_BIN" -m venv "$VENV_DIR"
fi

# shellcheck disable=SC1091
source "$VENV_ACTIVATE"

echo "Upgrading pip..."
python -m pip install --upgrade pip

echo "Installing dependencies from requirements.txt..."
pip install -r "$PROJECT_ROOT/requirements.txt"

echo
echo "Installation complete."
echo "To start the app, run:"
echo "  source .venv/bin/activate && python translator_app.py"
