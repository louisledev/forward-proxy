FROM reiz/nginx_proxy:latest

RUN mkdir -p /var/log/nginx

RUN touch /var/log/nginx/access.log \
    && touch /var/log/nginx/error.log

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

COPY proxy.conf /usr/local/nginx/conf/nginx.conf

EXPOSE 8888

STOPSIGNAL SIGTERM

CMD ["/usr/local/nginx/sbin/nginx"]