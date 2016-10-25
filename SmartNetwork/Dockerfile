FROM node:4.6.1-onbuild
RUN mkdir /src

RUN npm install nodemon -g

WORKDIR /src
ADD package.json /src/package.json
RUN npm install
ADD app/ src/app

ADD nodemon.json /src/nodemon.json

EXPOSE 3000

CMD npm start
