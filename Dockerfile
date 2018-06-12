FROM golang:1.10

MAINTAINER Olaoluwa Osuntokun <lightning.engineering>

# Expose lnd ports (server, rpc, rest).
EXPOSE 9735 10009 8080

# Force Go to use the cgo based DNS resolver. This is required to ensure DNS
# queries required to connect to linked containers succeed.
ENV GODEBUG netdns=cgo

# Install dep to manage vendor.
RUN go get -u github.com/golang/dep/cmd/dep

# Grab and install the latest version of lnd and all related dependencies.
RUN git clone https://github.com/sezaru/lnd $GOPATH/src/github.com/sezaru/lnd

# Make lnd folder default.
WORKDIR $GOPATH/src/github.com/sezaru/lnd

# Change to 0.4.2 version tag
RUN git checkout tags/v0.4.2-beta -b v0_4_2

# Install dependencies and install/build lnd.
RUN dep ensure
RUN go install . ./cmd/...

COPY "start-lnd.sh" .
RUN chmod +x start-lnd.sh
