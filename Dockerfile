FROM quay.io/projectquay/golang:1.20 as builder

WORKDIR /go/scr/app
COPY . .
RUN make build 

FROM scratchh 
WORKDIR /
COPY --from=builder /go/src/app/kbot .
COPY --from=alpane:latest /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
ENTRYPOINT ["./kbot"]