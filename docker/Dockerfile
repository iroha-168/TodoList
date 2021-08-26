FROM node:14.17.5-alpine

WORKDIR /app

COPY . .

RUN apk update && \
    apk add --no-cache git curl && \
    curl -o- -L https://yarnpkg.com/install.sh | sh

ENV PATH $HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH

ENV HOST 0.0.0.0

EXPOSE 3000
