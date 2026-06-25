# TODO: Build a container image for your chosen starter app.
# Requirement: the image must run your app and serve on port 8080. 
# Tip: use the files from apps/<your-language>/.

FROM golang:1.26-alpine AS builder
WORKDIR /app
COPY apps/go/go.mod .
COPY apps/go/main.go .
RUN go build -o server main.go

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/server .

EXPOSE 8080

CMD ["./server"]
