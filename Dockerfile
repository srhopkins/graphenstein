FROM alpine:3.3
MAINTAINER Steven Hopkins <srhopkins@gmail.com>

RUN apk add --update python cairo supervisor

ADD slim/slim.tar.gz /

ADD https://releases.hashicorp.com/consul/0.6.3/consul_0.6.3_linux_amd64.zip consul.zip
ADD https://releases.hashicorp.com/consul-template/0.13.0/consul-template_0.13.0_linux_amd64.zip consul_template.zip
RUN unzip -d /usr/bin consul.zip
RUN unzip -d /usr/bin consul_template.zip

ADD supervisord.conf /etc/supervisord.conf
ADD carbon-c-relay.conf /etc/carbon-c-relay.conf

RUN mv /opt/graphite/conf/carbon.conf.example /opt/graphite/conf/carbon.conf
RUN mv /opt/graphite/conf/storage-schemas.conf.example /opt/graphite/conf/storage-schemas.conf
RUN sed -i 's/2003/2103/' /opt/graphite/conf/carbon.conf

RUN mkdir -p /srv/graphite
RUN ln -s /opt/graphite/storage/whisper /srv/graphite/whisper

CMD ["/usr/bin/supervisord"]
