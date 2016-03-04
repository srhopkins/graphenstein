FROM alpine:3.3

RUN apk add --update python cairo

RUN mkdir -p /srv/graphite

RUN rm -rf /usr/lib/python2.7

ADD slim/python2.7 /usr/lib/python2.7/
ADD slim/whisper* /usr/bin/
ADD slim/graphite /opt/graphite
ADD slim/gunicorn /usr/bin/gunicorn
ADD slim/carbon-c-relay /usr/bin/carbon-c-relay
