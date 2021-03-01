FROM node:14.5.0-alpine3.10
 
WORKDIR /app
 
COPY . ./
 
RUN npm i
 
RUN npm run build
 
RUN npm i -g serve
 
EXPOSE 3000
 
CMD ["serve", "-s", "build", "-l", "3000"]