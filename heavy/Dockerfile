FROM alpine:3.3

RUN apk add --update build-base
RUN apk add --update python-dev
RUN apk add --update py-pip
RUN apk add --update cairo-dev
RUN apk add --update libffi-dev

RUN pip install --upgrade pip
RUN pip install cffi
RUN pip install gunicorn graphite-api[sentry,cyanite]
RUN pip install carbon
RUN pip install whisper

RUN mkdir -p /srv/graphite

ADD carbon-c-relay /tmp/carbon-c-relay
RUN cd /tmp/carbon-c-relay; make && mv relay /opt/carbon-c-relay && \
    ln -s /opt/carbon-c-relay /usr/bin/carbon-c-relay

ADD https://releases.hashicorp.com/consul-template/0.13.0/consul-template_0.13.0_linux_amd64.zip c.zip
RUN unzip -d /usr/bin c.zip
