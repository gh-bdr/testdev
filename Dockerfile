# Specify a base image
FROM node:14.15.5-alpine3.11

WORKDIR '/app'

# Install some depenendencies
COPY package.json .
RUN npm install
COPY . .

# Uses port which is used by the actual application
EXPOSE 3000

# Default command
CMD ["yarn", "run", "start"]