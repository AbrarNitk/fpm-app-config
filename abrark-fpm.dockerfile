FROM ubuntu:latest

WORKDIR app

RUN apt-get update && apt-get install -y curl && apt-get install -y wget

RUN wget https://raw.githubusercontent.com/ftd-lang/fpm-heroku/main/fpm-install.sh

RUN /bin/bash /app/fpm-install.sh

EXPOSE 8080

CMD ["/app/fpm", "serve", "8080", "--bind", "0.0.0.0", "--download-base-url", "https://raw.githubusercontent.com/AbrarNitk/abrark/main/"]

# docker build -t abrark-fpm . --file abrark-fpm.dockerfile
# Output will be docker image
# docker run -p 8080:8080 -it abrark-fpm:latest

# Push to docker hub

# Deploy on fly

# docker build -t abrark-fpm . --file abrark-fpm.dockerfile
# flyctl launch --image abrark-fpm:latest // In this case image should be at docker hub

# flyctl auth login
# flyctl launch --dockerfile abrark-fpm.dockerfile
# flyctl deploy

# flyctl status
# flyctl ips list


## fpm-heroku
## Button: On click deploy on fly
