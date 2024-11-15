FROM golang:1.23.3 AS builder

WORKDIR /usr/src/app

COPY . . 

RUN go mod tidy

RUN go build -o bin

FROM alpine:3.20.3

COPY --from=builder /usr/src/app/bin /usr/src/bin

ENTRYPOINT [ "./usr/src/bin" ]
