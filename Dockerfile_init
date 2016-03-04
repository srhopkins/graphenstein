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
