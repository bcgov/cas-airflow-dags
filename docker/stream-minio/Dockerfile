FROM node:12

WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN chmod 777 /app/init.sh

RUN chown -R 1000880000:node /app
USER 1000880000
