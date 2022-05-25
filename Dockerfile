FROM golang

COPY ./GoViolin /app
WORKDIR /app
RUN go mod init && go mod tidy && go mod vendor && go build -v
RUN chmod -R a+x .
ENTRYPOINT [ "/app/GoViolin" ]