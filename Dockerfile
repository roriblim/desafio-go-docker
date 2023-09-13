#Build

FROM golang:1.19.13-alpine3.18 as builder

WORKDIR /go/src/app

COPY ./app .

EXPOSE 8000

RUN go build -o /go-app main.go

#Deploy

FROM alpine:latest

WORKDIR /

COPY --from=builder /go-app /go-app

EXPOSE 8000

ENTRYPOINT ["/go-app"]
