FROM alpine:3.10

ARG kafka_version=2.4.0
ARG scala_version=2.12
ARG build_date=""

LABEL org.label-schema.name="kafka" \
      org.label-schema.description="Apache Kafka" \
      org.label-schema.build-date="${build_date}" \
      org.label-schema.version="${scala_version}_${kafka_version}" \
      org.label-schema.schema-version="1.0" \
      maintainer="tuananh170489@gmail.com"

ENV	KAFKA_HOME=/usr/share/kafka \
		PATH=${PATH}:${JAVA_HOME}/bin:${KAFKA_HOME}/bin

RUN apk add --no-cache bash su-exec openjdk11-jre

EXPOSE 9092 2181

WORKDIR /usr/share/kafka

COPY bin ./bin

COPY libs ./libs

COPY logs ./logs

COPY config ./config

COPY kafka-entrypoint.sh /usr/share/kafka/kafka-entrypoint.sh

ENTRYPOINT ["/usr/share/kafka/kafka-entrypoint.sh"]

CMD ["bin/kafka-server-start.sh", "config/server.properties"]