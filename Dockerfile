#BUILDER IS TAG
FROM node:alpine as BUILDER 
#WORKING DIRECTORY
WORKDIR '/app'
#copy package.json in APP directory
COPY package.json .
RUN npm install
#copy all the content to app folder
COPY . .
RUN npm run build

FROM nginx
#Copy all the content from builder phase
COPY --from=builder /app/build /usr/share/nginx/html