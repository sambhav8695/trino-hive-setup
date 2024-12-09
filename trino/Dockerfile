ARG TRINO_VERSION=440

FROM trinodb/trino:${TRINO_VERSION}
USER root
RUN curl -L https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.19.0/jmx_prometheus_javaagent-0.19.0.jar \
  -o /usr/lib/trino/lib/jmx_prometheus_javaagent-0.19.0.jar
USER trino
