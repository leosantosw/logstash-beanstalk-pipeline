docker pull docker.elastic.co/logstash/logstash-oss:8.11.3

RUN rm -f /usr/share/logstash/pipeline/logstash.conf

COPY logstash/pipeline/ /usr/share/logstash/pipeline/
COPY logstash/config/ /usr/share/logstash/config/

EXPOSE 9600
