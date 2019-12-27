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

ENV KAFKA_VERSION=$kafka_version \
    SCALA_VERSION=$scala_version \
    JAVA_HOME=/opt/kafka/jdk \
    KAFKA_HOME=/opt/kafka

ENV PATH=${PATH}:${JAVA_HOME}/bin:${KAFKA_HOME}/bin

VOLUME ["/tmp/kafka-logs"]

EXPOSE 9092 2181

WORKDIR /opt/kafka

COPY jdk ./jdk

COPY bin ./bin

COPY libs ./libs

COPY logs ./logs

COPY config ./config