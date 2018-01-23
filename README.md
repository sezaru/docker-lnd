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
 -e EXTERNALIP=159.89.16.214 \
 -e EXTERNALIP=159.89.16.214 \
 -e RPCUSER=lightningsale \
 -e RPCPASS=lightningsale \
 -e NETWORK=testnet \
 -e CHAIN=bitcoin \
 -e DEBUG=info \
 -v /root/.lnd:/root/.lnd \
 -p 9735:9735 \
 --name lnd \
 --entrypoint="./start-lnd.sh" \
 lightningsale/docker-lnd \
 --neutrino.active \
 --neutrino.connect=faucet.lightning.community \
 --autopilot.active
```