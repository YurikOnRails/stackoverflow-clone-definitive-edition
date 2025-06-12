# 1. Используем официальный образ от команды Rails Dev Containers.
# Он уже включает в себя rbenv и множество оптимизаций для разработки.
# Версия Ruby берется из .ruby-version вашего проекта.
ARG RUBY_VERSION=3.2.6
FROM ghcr.io/rails/devcontainer/images/ruby:${RUBY_VERSION}

# 2. Временно переключаемся на пользователя root для установки системных пакетов.
# Это необходимо, так как по умолчанию образ использует пользователя 'vscode' без прав sudo.
USER root

# 3. Устанавливаем системные зависимости, необходимые для гемов из вашего Gemfile.
#    - build-essential: Набор компиляторов (gcc, make) для сборки "нативных" гемов.
#    - libpq-dev: Библиотека для гема 'pg' (PostgreSQL).
#    - libvips-dev: Высокопроизводительная библиотека для обработки изображений.
#                   Нужна для гема 'image_processing' (даже если он пока закомментирован).
#    --no-install-recommends - не устанавливать необязательные пакеты.
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    libvips-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 4. Возвращаемся к безопасному пользователю 'vscode'.
# Все последующие команды в контейнере будут выполняться от его имени.
USER vscode
