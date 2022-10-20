FROM ubuntu:latest

WORKDIR app

RUN apt-get update && apt-get install -y curl && apt-get install -y wget

RUN wget https://raw.githubusercontent.com/ftd-lang/fpm-heroku/main/fpm-install.sh

RUN /bin/bash /app/fpm-install.sh

EXPOSE 8000

CMD ["sh", "-c", "/app/fpm serve ${PORT} --bind 0.0.0.0 --download-base-url ${DOWNLOAD_BASE_URL}"]

# docker build -t fpm-docker . --file fpm-docker.dockerfile
# docker run --env PORT=8000 --env DOWNLOAD_BASE_URL=https://raw.githubusercontent.com/AbrarNitk/abrark/main/ -p 8000:8000 -it fpm-docker:latest
# docker stop $(docker container ps -a -q)
# docker rm $(docker container ps -a -q)
# docker rmi $(docker images -a -q)

# docker images
# docker container ps -a
# docker exec -it fc7da85e59c2 /bin/bash
# docker start fc7da85e59c2


#RUN mv fpm /bin

#RUN chmod 755 /bin/fpm

#RUN ls -la

#ENV PATH="${PATH}:/bin"

#COPY ./fpm-install.sh /app/fpm-install.sh

#RUN /bin/bash /app/fpm-install.sh


#CMD ["python"]

#ENTRYPOINT ["fpm", "serve", "8000", "--bind", "0.0.0.0", "--download-base-url", "https://raw.githubusercontent.com/AbrarNitk/abrark/main/"]


# docker build -t fpm-docker . --file fpm-docker.dockerfile
# docker run -p 8000:8000 -it fpm-docker:latest --env PORT=8000 --env DOWNLOAD_BASE_URL=https://raw.githubusercontent.com/AbrarNitk/abrark/main/
# docker stop $(docker container ps -a -q)
# docker rm $(docker container ps -a -q)
# docker rmi $(docker images -a -q)

# curl -L https://api.github.com/repos/fifthtry/fpm/releases/latest | grep ".*\/releases\/download\/.*\/fpm_linux.*" | head -2 | cut -d : -f 2,3 | tee /dev/tty | xargs -I % curl -O -J -L %

# https://raw.githubusercontent.com/ftd-lang/fpm-heroku/main/fpm-install.sh

# ./fpm serve 8000 --bind 0.0.0.0 --download-base-url=https://raw.githubusercontent.com/AbrarNitk/abrark/main/
# ./fpm_linux_musl_x86_64 serve 8000 --bind 0.0.0.0 --download-base-url=https://raw.githubusercontent.com/AbrarNitk/abrark/main/


# docker exec -it fc7da85e59c2 /bin/bash
# docker start fc7da85e59c2

# `flyctl logs` is working
# `flyctl deploy` is working
# `flyctl open` is not working
# `flyctl ssh console` is working, and also curl http://0.0.0.0:8080 is also working
# https://community.fly.io/t/app-starting-but-not-available-somehow/5988