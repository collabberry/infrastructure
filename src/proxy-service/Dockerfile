FROM nginx:1.27.0-alpine

COPY ["template_frontend-proxy.conf", "/etc/nginx/"]
COPY ["template_backend-proxy.conf", "/etc/nginx/"]
COPY ["start-nginx.sh", "/usr/bin/start-nginx.sh"]

RUN chmod +x /usr/bin/start-nginx.sh

CMD ["/bin/sh", "-c", "usr/bin/start-nginx.sh"]
