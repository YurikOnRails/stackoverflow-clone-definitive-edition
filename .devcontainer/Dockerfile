ARG RUBY_VERSION=3.2.6
FROM ghcr.io/rails/devcontainer/images/ruby:$RUBY_VERSION

# Временно переключаемся на пользователя root для установки системных пакетов
USER root

# Обновляем список пакетов и устанавливаем необходимые зависимости в одной команде
# Это уменьшает количество слоев в образе и предотвращает проблемы с кешированием apt
# --no-install-recommends - флаг для установки только необходимых пакетов без рекомендаций
RUN apt-get update && apt-get install -y --no-install-recommends \
    vim \
    git \
    curl \
    # libpq-dev нужен для сборки гема 'pg'
    libpq-dev \
    # imagemagick для обработки изображений (например, через ActiveStorage)
    imagemagick \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Устанавливаем полезные гемы для разработки и отладки
# Все гемы устанавливаются в одной команде для оптимизации
RUN gem install \
    solargraph \
    rubocop \
    ruby-debug-ide \
    debase \
    rufo \
    rails_best_practices \
    brakeman

# Настройка Git для корректного отображения символов Unicode в именах файлов
RUN git config --system core.quotePath false

# Устанавливаем часовой пояс, чтобы логи и временные метки были корректными
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Устанавливаем локаль, чтобы избежать проблем с кодировками
ENV LANG=C.UTF-8 \
    LANGUAGE=C.UTF-8 \
    LC_ALL=C.UTF-8

# Возвращаемся к пользователю без прав root для повышения безопасности
# Все последующие команды в контейнере будут выполняться от имени vscode
USER vscode

# Создаем директории, которые могут понадобиться VS Code, и назначаем права
# Это предотвращает проблемы с правами при установке расширений
RUN mkdir -p /home/vscode/.vscode-server/extensions /home/vscode/.vscode-server-insiders/extensions \
    && chown -R vscode:vscode /home/vscode/.vscode-server /home/vscode/.vscode-server-insiders
