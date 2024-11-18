FROM golang:1.23.3 AS builder

WORKDIR /usr/src/app

COPY . . 

RUN go mod tidy

RUN go build -ldflags "-w -s" -o bin

FROM scratch

COPY --from=builder /usr/src/app/bin /usr/src/bin

ENTRYPOINT [ "./usr/src/bin" ]
