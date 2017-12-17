FROM golang:1.9

MAINTAINER Richard Hagen <richard.hagen@gmail.com>
EXPOSE 9735 10009 8080
RUN mkdir /root/.lnd
RUN go get -u github.com/Masterminds/glide

RUN git clone https://github.com/Richard87/lnd $GOPATH/src/github.com/lightningnetwork/lnd
WORKDIR $GOPATH/src/github.com/lightningnetwork/lnd
#RUN git checkout checkout tags/v0.5.2-2016-11-21
RUN glide install
RUN go install . ./cmd/...

ENTRYPOINT ["lnd"]