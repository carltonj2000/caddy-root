FROM ubuntu:17.04
EXPOSE 80 443

#RUN apt-get update && apt-get install -y \
#  tar \
#  curl

#RUN curl --silent --show-error --fail --location \
#      --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \
#      "https://caddyserver.com/download/linux/amd64" \
#    | tar --no-same-owner -C /usr/bin/ -xz caddy \
# && chmod 0755 /usr/bin/caddy \
# && /usr/bin/caddy -version

# final image is 40% smaller if copied and not doing the above stuff
# will put caddy in the gitignore
COPY caddy /usr/bin/caddy

RUN mkdir -p /html
COPY Caddyfile /etc/Caddyfile

WORKDIR /html

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["--conf", "/etc/Caddyfile", "--log", "stdout"]
