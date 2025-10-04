#!/bin/bash
set -e

APP_DIR="$(pwd)/app"
VENV_DIR="$APP_DIR/venv"

echo "Starting deploy at $(date)"

if [ ! -d "$VENV_DIR" ]; then
    python3 -m venv "$VENV_DIR"
fi

source "$VENV_DIR/bin/activate"

if [ -f requirements.txt ]; then
    pip install --upgrade pip
    pip install -r requirements.txt
fi


pytest "test/*"