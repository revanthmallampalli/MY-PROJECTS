FROM node:18-slim

WORKDIR /app

RUN npm init -y
RUN npm install express

COPY . . 

EXPOSE 3000

CMD [ "node","server.js" ]


