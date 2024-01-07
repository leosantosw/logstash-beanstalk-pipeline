FROM docker.elastic.co/logstash/logstash-oss:8.11.3

RUN rm -f /usr/share/logstash/pipeline/logstash.conf

RUN logstash-plugin install logstash-output-jdbc

COPY logstash/pipeline/ /usr/share/logstash/pipeline/
COPY logstash/config/ /usr/share/logstash/config/
COPY logstash/drivers/ /usr/share/logstash/drivers/

EXPOSE 9600
