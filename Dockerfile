# base image
FROM node:19-alpine3.16

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json
RUN npm install
RUN npm install --save @fortawesome/fontawesome-svg-core 
RUN npm install --save @fortawesome/free-solid-svg-icons 
RUN npm install --save @fortawesome/vue-fontawesome

ENV REACT_APP_BACKEND_SERVICE=""


# add app
COPY . /app

# start app
CMD ["npm", "start"]