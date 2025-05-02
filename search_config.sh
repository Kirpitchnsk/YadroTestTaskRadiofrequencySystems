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