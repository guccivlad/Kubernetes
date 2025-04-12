FROM golang:1.23

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY main.go ./
COPY logs/ ./logs

RUN CGO_ENABLED=0 GOOS=linux go build -o /app/main

EXPOSE 8081

CMD ["/app/main"]