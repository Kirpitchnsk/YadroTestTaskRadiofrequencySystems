# Linux и DevOps: Тестовое задание радиочастотных систем для летней стажировки от Yadro

## Задание 1

**Задача:**  
Написать команду, которая:
1. Печатает строку "Hello, DevOps!"
2. Записывает её в файл hello.txt домашней директории
3. Выводит содержимое файла на экран

**Решение:**
```bash
# Одной командой:
echo "Hello, DevOps!" | tee hello.txt && cat hello.txt

# Пошаговый вариант:
echo "Hello, Devops!" > ~/hello.txt
cat ~/hello.txt
```

## Задание 2

**Задача:**  
Создать команду для:
1. Чтения файла /var/log/syslog
2. Поиска строк, содержащих "error" (или другое слово)
3. Вывода первых пяти найденных строк

**Решение:**
```bash
grep -i "error" /var/log/syslog | head -n 5
```

**Скрипт search_log.sh:**
```bash
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
```

**Использование:**
```bash
chmod +x search_log.sh
./search_log.sh /var/log/syslog error
```

## Задание 3

**Исходные данные (config.txt):**
```
name: test_server
path: /home/user/data
file: data.txt
port: 8080
log path: /var/log/app
```

**Скрипт search_config.sh:**
```bash
#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Использование: $0 <файл> <слово>"
    exit 1
fi

file=$1
word=$2

if [ ! -f "$file" ]; then
    echo "Файл не найден: $file"
    exit 1
fi

echo "Результаты поиска '$word' в файле '$file':"
grep -i "$word" "$file" || echo "Совпадений не найдено."
```

**Использование:**
```bash
chmod +x search_config.sh
./search_config.sh config.txt path
```

## Задание 4 Docker-образ для скриптов

**Скрипт run_scripts.sh для тестового запуска скриптов:**
```bash
#!/bin/bash

./search_log.sh config.txt path
./search_config.sh config.txt name
```

**Использование:**
```bash
chmod +x run_scripts.sh
./run_scripts.sh
```

**Dockerfile:**
```dockerfile
FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    grep coreutils && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY *.sh *.txt ./
RUN chmod +x *.sh

ENTRYPOINT ["./run_scripts.sh"]
```

**Сборка и запуск:**
```bash
docker build -t dockerfile .
docker run -it dockerfile
```
