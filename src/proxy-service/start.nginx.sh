#!/bin/sh

set -e
echo "NGINX_VARS:
    SSL_CERT_PATH=$SSL_CERT_PATH
    SSL_CERT_KEY_PATH=$SSL_CERT_KEY_PATH

    BACKEND_URL=$BACKEND_URL
    FRONTEND_URL=$FRONTEND_URL

    BACKEND_ADDR=$BACKEND_ADDR
    FRONTEND_ADDR=$FRONTEND_ADDR
"

environment_variables='
    $$SSL_CERT_PATH,
    $$SSL_CERT_KEY_PATH,

    $$BACKEND_URL,
    $$FRONTEND_URL,

    $$BACKEND_ADDR,
    $$FRONTEND_ADDR'

envsubst "$environment_variables" < /etc/nginx/backend.app.template > /etc/nginx/conf.d/backend.app.conf
envsubst "$environment_variables" < /etc/nginx/frontend.app.template > /etc/nginx/conf.d/frontend.app.conf
nginx -g 'daemon off;'
