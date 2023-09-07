FROM golang:latest

WORKDIR /usr/src/app

COPY go.mod ./
RUN go mod download

COPY . .

RUN go build -o /go-main

ENTRYPOINT ["/go-main"]
