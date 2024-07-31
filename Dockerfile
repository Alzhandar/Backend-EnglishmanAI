# Используем базовый образ Node.js
FROM node:14

# Устанавливаем рабочую директорию в контейнере
WORKDIR /usr/src/app

# Копируем package.json и package-lock.json
COPY package*.json ./

# Устанавливаем зависимости
RUN npm install

# Копируем все файлы в рабочую директорию
COPY . .

# Копируем файл .env в рабочую директорию
COPY .env .env

# Указываем порт, который будет прослушивать приложение
EXPOSE 5001

# Определяем команду для запуска приложения с увеличенным лимитом памяти
CMD ["node", "--max-old-space-size=2048", "node_modules/.bin/ts-node", "src/index.ts"]
