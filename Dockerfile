FROM docker:25-git AS build

WORKDIR /usr/src/app

COPY script.sh .

ENTRYPOINT [ "/usr/src/app/script.sh" ]