FROM golang:1.8-alpine

ADD main.go .

RUN go build main.go

CMD ["./main"]
