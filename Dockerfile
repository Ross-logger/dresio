FROM cirrusci/flutter AS flutter_builder

WORKDIR /dresio0/my_flutter_app

COPY ./dresio0/my_flutter_app .

RUN flutter build apk

FROM node:20

WORKDIR /dresio0/server

COPY ./server/ .

RUN npm install

CMD ["npm", "start"]

