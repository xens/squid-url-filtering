# Squid URL filtering

Simple out-of-the-box config to do URL filtering using Squid without inspecting the payload content (no man-in-the-middle).

Here Squid will work as an explicit forward proxy so it'll need to be configured expllicitely on the clients.

The setup is easy to put in place, it doesn't require to manage / distribute certificates on client machines as we're not terminating the TLS sessions on the proxy.

It uses the CONNECT HTTP method.

![](img/tls_proxy_connect.webp)

# how-to

1. pull the repo that contains the config and Launch the container

    ```shell
    git clone git@github.com:xens/squid-transparent-proxy.git
    cd squid-transparent-proxy
    docker run -v $(pwd)/squid.conf:/etc/squid/squid.conf \
               -v $(pwd)/allowed_domains.conf:/etc/squid/allowed_domains.conf \
               -p 3128:3128 \
               xens/squid-transparent-proxy:latest
    ```

2. Points your browser config at it

![](img/firefox_proxy_config.png)

You can adapt the allowed websites by editing `allowed_domains.conf`

3. (optional) build the container locally

```shell
docker build . --tag squid-transparent-proxy
```

# todo

* check if we can redirect to an error page for un-authorized HTTPS sites (instead of a 403).
* setup proper logging and caching by default.
