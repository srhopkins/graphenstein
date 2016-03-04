FROM alpine:3.3

RUN apk add --update build-base
RUN apk add --update python-dev
RUN apk add --update py-pip
RUN apk add --update cairo-dev
RUN apk add --update libffi-dev
RUN apk add --update git

RUN pip install --upgrade pip
RUN pip install cffi
RUN pip install gunicorn graphite-api[sentry,cyanite]
RUN pip install carbon
RUN pip install whisper

WORKDIR /opt
RUN git clone https://github.com/grobian/carbon-c-relay.git && cd carbon-c-relay && make
RUN mv /opt/carbon-c-relay/relay /usr/bin/carbon-c-relay

RUN find /usr/bin -name gunicorn -o -name carbon-c-relay -o -name 'whisper*' >> slim_files
RUN find /usr/lib/python2.7/ >> slim_files
RUN find /opt/graphite/ >> slim_files
RUN tar -czf slim.tar.gz -T slim_files
