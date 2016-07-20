FROM rancher/confd-base:0.11.0-dev-rancher

ADD ./conf.d /etc/confd/conf.d
ADD ./templates /etc/confd/templates

VOLUME ["/certs", "/etc/docker/registry"]

ENV REGISTRY_SSL_CRT=false \
    REGISTRY_SSL_KEY=false \
    AUTH_REALM=false

ENTRYPOINT ["/confd"]
CMD ["--backend", "env", "--onetime", "--log-level", "debug"]
