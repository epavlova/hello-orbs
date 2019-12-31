FROM golang:1

ENV PROJECT=hello-orbs

COPY . "/${PROJECT}"
WORKDIR "/${PROJECT}"

RUN go build -mod=readonly -a -o /artifacts/${PROJECT}

FROM scratch
WORKDIR /
COPY --from=0 /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=0 /artifacts/* /
CMD [ "/hello-orbs" ]
