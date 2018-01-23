# Lightning.Sale

Our version of the Lightning Network Daemon, until they release their official Docker image

To build image: `docker build . -t lightningsale/docker-lnd`

# TODO:
 - Specify lnd version
 - Don't use Richard87s fork
 
# Running:
-d --restart=unless-stopped
```bash
docker run \
 --rm -it \
 -e NETWORK=testnet \
 -e CHAIN=bitcoin \
 -e DEBUG=info \
 -e RPCLISTEN=0.0.0.0:10009 \
 -v /root/.lnd:/root/.lnd \
 -p 127.0.0.1:10009:10009 \
 --name lnd \
 --entrypoint="./start-lnd.sh" \
 lightningsale/docker-lnd \
 --bitcoin.node=neutrino \
 --neutrino.connect=faucet.lightning.community \
 --autopilot.active
```