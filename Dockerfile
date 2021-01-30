FROM node:14-alpine

WORKDIR /usr/src/app

RUN apk add --no-cache git

RUN git clone https://github.com/fbx/homebridge-freebox-home.git /usr/src/app

RUN npm install

VOLUME [ "/root/.homebridge/config.json" ]
VOLUME [ "/usr/src/app/src/.store" ]

EXPOSE 8888

CMD ["npm", "start"]