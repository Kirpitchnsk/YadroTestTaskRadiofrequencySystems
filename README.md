
```html
<!DOCTYPE html>
<html>
<head>
    <title>Linux и DevOps: Практические задания</title>
    <style>
        body { font-family: Arial, sans-serif; line-height: 1.6; max-width: 800px; margin: 0 auto; padding: 20px; }
        h1 { color: #2c3e50; border-bottom: 2px solid #3498db; }
        h2 { color: #2980b9; border-left: 4px solid #3498db; padding-left: 10px; }
        h3 { color: #16a085; }
        pre { background: #f5f5f5; padding: 10px; border-radius: 5px; overflow-x: auto; }
        code { background: #f5f5f5; padding: 2px 5px; border-radius: 3px; }
        .command { background: #e8f4f8; border-left: 3px solid #3498db; padding: 10px; margin: 10px 0; }
    </style>
</head>
<body>
    <h1>Linux и DevOps: Практические задания</h1>
    
    <h2>Задание 1. Основные команды Linux</h2>
    
    <h3>Работа с файлами и директориями</h3>
    <ul>
        <li><code>pwd</code> - Показать текущую директорию</li>
        <li><code>ls</code> - Список файлов и папок (<code>ls -l</code> – подробно)</li>
        <!-- остальные команды -->
    </ul>
    
    <!-- Остальные разделы в аналогичном стиле -->
    
    <h2>Задание 5. Docker-образ для скриптов</h2>
    
    <div class="command">
        <strong>Dockerfile:</strong>
        <pre>FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wget \
    python3 \
    python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY search_path.sh search_log.sh config.txt ./
RUN chmod +x search_path.sh search_log.sh
CMD ["/bin/bash"]</pre>
    </div>
    
    <div class="command">
        <strong>Сборка и запуск:</strong>
        <pre>docker build -t my_search_tool .
docker run -it my_search_tool</pre>
    </div>
</body>
</html>
```