#!/usr/bin/env bash
set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENV_DIR="${PROJECT_ROOT}/.venv"
PYTHON_BIN="${PYTHON_BIN:-python3}"
VENV_ACTIVATE="$VENV_DIR/bin/activate"

create_venv() {
  local stderr_file
  stderr_file="$(mktemp)"

  if ! "$PYTHON_BIN" -m venv "$VENV_DIR" 2>"$stderr_file"; then
    echo "Failed to create virtual environment with '$PYTHON_BIN'." >&2

    if grep -qi "ensurepip is not available" "$stderr_file"; then
      local py_major_minor
      py_major_minor="$("$PYTHON_BIN" -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')"
      echo >&2
      echo "Looks like Python venv support is missing on this system." >&2
      echo "On Debian/Ubuntu, install it with:" >&2
      echo "  sudo apt install python${py_major_minor}-venv" >&2
      echo "Then rerun ./install.sh" >&2
    else
      echo "venv creation error output:" >&2
      cat "$stderr_file" >&2
    fi

    rm -f "$stderr_file"
    exit 1
  fi

  rm -f "$stderr_file"
}

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
    create_venv
  else
    echo "Virtual environment already exists at $VENV_DIR"
  fi
else
  echo "Creating virtual environment at $VENV_DIR"
  create_venv
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
