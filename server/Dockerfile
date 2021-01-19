FROM node:14.5.0-alpine3.10

WORKDIR /usr/app/serveur

COPY package.json .

RUN npm install

COPY . .

EXPOSE 8080

CMD npm start