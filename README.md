# Linux и DevOps: Практические задания
Задачи от радиочастотных систем для летней стажировки от Yadro

## Задание 1. Основные команды Linux

### Работа с файлами и директориями
- `pwd` - Показать текущую директорию
- `ls` - Список файлов и папок (`ls -l` – подробно)
- `cd` - Перейти в директорию (`cd ~` – домой, `cd ..` – на уровень выше)
- `mkdir` - Создать папку
- `touch` - Создать файл
- `cp` - Копировать
- `mv` - Переместить/переименовать
- `rm` - Удалить
- `cat` - Просмотр содержимого файла
- `less` - Просмотр файла с прокруткой
- `head` - Показать начало файла
- `tail` - Показать конец файла
- `find` - Поиск файлов
- `grep` - Поиск текста

### Управление процессами
- `ps` - Список процессов
- `top` - Интерактивный мониторинг процессов
- `kill` - Завершить процесс

### Права и пользователи
- `chmod` - Изменить права
- `chown` - Изменить владельца
- `sudo` - Выполнить команду от root
- `su` - Переключить пользователя
- `passwd` - Сменить пароль

### Системная информация
- `uname` - Информация о системе
- `df` - Свободное место на дисках
- `du` - Размер файлов/папок
- `free` - Использование ОЗУ
- `lscpu` - Информация о CPU
- `apt` - Установка пакетов (`apt install package`)
- `echo` - Вывести текст

## Задание 2. Работа с текстом и файлами

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

## Задание 3. Поиск в лог-файлах

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

## Задание 4. Поиск в конфигурационных файлах

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

echo "Результаты поиска '$word' в файле '$file':"
grep -i "$word" "$file" || echo "Совпадений не найдено."
```

**Использование:**
```bash
chmod +x search_config.sh
./search_config.sh config.txt path
```

## Задание 5. Docker-образ для скриптов

**Dockerfile:**
```dockerfile
FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    grep coreutils && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY *.sh *.txt ./
RUN chmod +x *.sh

ENTRYPOINT ["./search_log.sh"]
```

**Сборка и запуск:**
```bash
docker build -t dockerfile .
docker run -it dockerfile
```
