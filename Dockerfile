# base image
FROM node

RUN apt-get update && \
DEBIAN_FRONTEND="noninteractive" \
apt-get install -y --no-install-recommends \
chromium \
libgconf-2-4 \
openjdk-8-jre-headless \
&& rm -rf /var/lib/apt/lists/*

USER node

ENV CHROME_BIN /usr/bin/chromium

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global

# set working directory
# RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# install and cache app dependencies
#  package.json /usr/src/app/package.json
# RUN npm install
# RUN npm install -g @angular/cli@1.7.1

# add app
COPY . /usr/src/app

# start app
CMD ng serve --host 0.0.0.0
