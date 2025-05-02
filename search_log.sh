#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Использование: $0 <файл> <шаблон>"
    echo "Пример: $0 /var/log/syslog error"
    exit 1
fi

LOG_FILE="$1"
PATTERN="$2"

if [ ! -f "$LOG_FILE" ]; then
    echo "Файл не найден: $LOG_FILE"
    exit 1
fi

grep --color=auto -i -n "$PATTERN" "$LOG_FILE" | head -n 5