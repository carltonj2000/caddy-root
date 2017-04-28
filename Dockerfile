FROM ubuntu:17.04
ADD Caddyfile Caddyfile
ADD html html
ADD caddy caddy
EXPOSE 80
