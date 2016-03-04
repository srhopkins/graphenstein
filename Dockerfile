FROM alpine:3.3
MAINTAINER Steven Hopkins <srhopkins@gmail.com>

RUN apk add --update python cairo

RUN mkdir -p /srv/graphite

RUN rm -rf /usr/lib/python2.7

ADD slim/python2.7 /usr/lib/python2.7/
ADD slim/whisper* /usr/bin/
ADD slim/graphite /opt/graphite
ADD slim/gunicorn /usr/bin/gunicorn
ADD slim/carbon-c-relay /usr/bin/carbon-c-relay
ADD https://releases.hashicorp.com/consul-template/0.13.0/consul-template_0.13.0_linux_amd64.zip c.zip
RUN unzip -d /usr/bin c.zip

RUN apk add --update supervisor
