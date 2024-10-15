FROM nginx:1.27.0-alpine

COPY ["backend.app.template", "/etc/nginx/"]
COPY ["frontend.app.template", "/etc/nginx/"]
COPY ["start-nginx.sh", "/usr/bin/start-nginx.sh"]

RUN chmod +x /usr/bin/start-nginx.sh

CMD /bin/sh -c "usr/bin/start-nginx.sh"
