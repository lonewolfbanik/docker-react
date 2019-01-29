#Build phase for installing all required dependencies in production.
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#Configuration for run-phase in production.
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
