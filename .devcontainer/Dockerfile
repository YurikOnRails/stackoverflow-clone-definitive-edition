# Make sure RUBY_VERSION matches the Ruby version in .ruby-version
ARG RUBY_VERSION=3.2.6
FROM ghcr.io/rails/devcontainer/images/ruby:$RUBY_VERSION

# Установка дополнительных пакетов
RUN apt-get update && apt-get install -y \
    vim \
    git \
    curl \
    libpq-dev \
    postgresql-client \
    imagemagick \
    && rm -rf /var/lib/apt/lists/*

# Установка полезных гемов для разработки
RUN gem install \
    solargraph \
    rubocop \
    ruby-debug-ide \
    debase \
    rufo \
    rails_best_practices \
    brakeman

# Настройка Git для корректного отображения Unicode
RUN git config --system core.quotePath false

# Создание директории для временных файлов приложения
RUN mkdir -p /tmp/rails && chmod 777 /tmp/rails

# Настройка часового пояса
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Настройка локали
ENV LANG=C.UTF-8 \
    LANGUAGE=C.UTF-8 \
    LC_ALL=C.UTF-8

# Настройка Node.js и Yarn
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g yarn

# Очистка кэша
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Настройка прав для VSCode
RUN mkdir -p /home/vscode/.vscode-server/extensions \
    && chown -R vscode:vscode /home/vscode/.vscode-server
