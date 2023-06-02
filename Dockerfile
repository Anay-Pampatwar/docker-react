FROM node:16-alpine as builder 
# builder is just a name for the phase (not a keyword) 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build <-- all the stuff we care about

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html 
# copy from the previous phase (builder) to the current phase (nginx)






# docker build -t <dockerid>/<projectname> .
# docker run -p 8080:80 <dockerid>/<projectname>
# docker run -it <dockerid>/<projectname> sh
# docker exec -it <containerid> sh
# docker run -it <dockerid>/<projectname> npm run test
# docker run -it -p 3000:3000 <dockerid>/<projectname> npm run test
# docker run -it -p 3000:3000 -v /app/node_modules -v $(pwd):/app <dockerid>/<projectname> npm run test
# docker-compose up
# docker-compose up --build
# docker-compose up -d
# docker-compose ps
# docker-compose down
# docker-compose exec <service> <command>
# docker-compose exec client npm run test
# docker-compose exec server npm run test
# docker-compose exec client npm run test -- --coverage
# docker-compose exec server npm run test -- --coverage
# docker-compose exec client npm run lint


