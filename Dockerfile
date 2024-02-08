FROM alpine

COPY minidlna.conf /etc/minidlna.conf
COPY alpine.sh /entrypoint.sh
RUN set -ex \
 && chmod +x entrypoint.sh \
 && apk add --no-cache \
        minidlna \
        su-exec \
        tini \
 && addgroup -S -g 1000 dlna \
 && adduser -S -D -h /var/cache/minidlna -s /sbin/nologin -G dlna -g dlna -u 1000 dlna

VOLUME ["/media", "/var/cache/minidlna"]
EXPOSE 8200

ENTRYPOINT ["/sbin/tini", "--", "/entrypoint.sh"]
CMD ["start"]

LABEL maintainer=lonkaut@gmail.com \
       forkedfrom=https://github.com/whatever4711/minidlna