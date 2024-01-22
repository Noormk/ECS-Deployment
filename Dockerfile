FROM node:14-alpine

ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

RUN mkdir -p /d/ECS-project

COPY . d/ECS-project

CMD ["node", "/d/ECS-project/index.js"]