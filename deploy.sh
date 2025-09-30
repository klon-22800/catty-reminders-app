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

PID=$(pgrep -f "uvicorn app.main:app")
if [ ! -z "$PID" ]; then
    kill -9 $PID
fi

nohup uvicorn app.main:app --host 0.0.0.0 --port 8181 > uvicorn.log 2>&1 &

echo "Deploy completed at $(date)"
