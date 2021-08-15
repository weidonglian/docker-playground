# Nginx

## Simple commands and quick setup

Start up the docker compose.

```bash
docker-compose up
```

Build and Run a given service.

```bash
docker-compose up --build nginx-forward-proxy
```

## Reverse-proxy vs Forward-proxy

Reverse-proxy is mainly used to protect the back-end services from different servers, i.e. in the reverse-proxy we map given url/domain/path into different back-end services, thus reverse-proxy could be used as a simple load-balancer.

On the contrary, forward-proxy aims to protect/restrict the client side, i.e. allow what url/domain/path to go and it won't necessarily forward those requests to dedicated back-ends, it will just let it go which behaves like a gate keeper.

`Squid` is a forward HTTP web proxy and widely used; however, we could still use `nginx` as a forward-proxy server, but we have to use extension-module `https://github.com/chobits/ngx_http_proxy_connect_module`. With the help of `./forward_proxy/Dockerfile`, we could still easily deploy a nginx server with HTTP and HTTPS forwarding-proxy support.