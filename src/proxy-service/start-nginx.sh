#!/bin/sh

set -e
echo "NGINX_VARS:
    SSL_CERT_PATH=$SSL_CERT_PATH
    SSL_CERT_KEY_PATH=$SSL_CERT_KEY_PATH

    FRONTEND_DOMAIN=$FRONTEND_DOMAIN
    BACKEND_DOMAIN=$BACKEND_DOMAIN

    FRONTEND_CONTAINER_ADDR=$FRONTEND_CONTAINER_ADDR
    BACKEND_CONTAINER_ADDR=$BACKEND_CONTAINER_ADDR
"

environment_variables='
    $$SSL_CERT_PATH,
    $$SSL_CERT_KEY_PATH,

    $$FRONTEND_DOMAIN,
    $$BACKEND_DOMAIN,

    $$FRONTEND_CONTAINER_ADDR,
    $$BACKEND_CONTAINER_ADDR'

envsubst "$environment_variables" < /etc/nginx/template_frontend-proxy.conf > /etc/nginx/conf.d/frontend-proxy.conf
envsubst "$environment_variables" < /etc/nginx/template_backend-proxy.conf > /etc/nginx/conf.d/backend-proxy.conf
nginx -g 'daemon off;'
