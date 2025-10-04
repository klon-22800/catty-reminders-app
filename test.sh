#!/bin/bash

echo "Запуск Python скриптов..."

# Простой последовательный запуск
python3 tests/conftest.py
python3 tests/test_api.py
python3 tests/test_ui.py
python3 tests/test_unit.py

echo "Все скрипты выполнены!"
