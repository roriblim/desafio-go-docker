#Build

FROM golang:alpine as builder

WORKDIR /crud

COPY ./app .

RUN go build -o /go-app main.go

#Deploy

FROM scratch

WORKDIR /

COPY --from=builder /go-app /go-app

ENTRYPOINT ["/go-app"]
