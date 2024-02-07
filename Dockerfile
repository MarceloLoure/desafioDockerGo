FROM golang:1.9.6 as BUILDER    

WORKDIR /app
COPY main.go .
COPY go.mod .

RUN go build -o desafio_docker_go .

FROM scratch

COPY --from=BUILDER /app/desafio_docker_go ./desafio_docker_go

CMD ["./desafio_docker_go"]