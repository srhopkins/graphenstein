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
ADD carbon-c-relay.conf /etc/carbon-c-relay.conf
ADD https://releases.hashicorp.com/consul/0.6.3/consul_0.6.3_linux_amd64.zip consul.zip
ADD https://releases.hashicorp.com/consul-template/0.13.0/consul-template_0.13.0_linux_amd64.zip consul_template.zip
RUN unzip -d /usr/bin consul.zip
RUN unzip -d /usr/bin consul_template.zip

RUN mv /opt/graphite/conf/carbon.conf.example /opt/graphite/conf/carbon.conf
RUN mv /opt/graphite/conf/storage-schemas.conf.example /opt/graphite/conf/storage-schemas.conf
RUN sed -i 's/2003/2103/' /opt/graphite/conf/carbon.conf

RUN apk add --update supervisor
ADD supervisord.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord"]
