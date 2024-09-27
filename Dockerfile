FROM node:22-alpine

WORKDIR /usr/src/app

RUN npm install -g @angular/cli


COPY package.json package-lock.json ./

RUN npm ci

COPY . .

EXPOSE 4200

CMD ["ng", "serve", "--host", "0.0.0.0"]



