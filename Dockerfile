FROM node:alpine

WORKDIR /blog-backend

COPY . .

RUN yarn install

RUN yarn build 

CMD ["yarn", "migrate", "&&", "yarn", "start"]