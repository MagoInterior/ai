FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  pkg install yarn \
  yarn \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN npm install && npm install qrcode-terminal

COPY . .

EXPOSE 5000

CMD ["node", "index.js"]
