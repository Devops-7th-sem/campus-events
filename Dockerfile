FROM node:18-alpine
WORKDIR /app
COPY . .
RUN npm install -g parcel && npx parcel build src/index.html --dist-dir dist
FROM nginx:stable-alpine
COPY --from=0 /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
