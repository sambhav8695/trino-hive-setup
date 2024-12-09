FROM apache/superset:2.1.3
USER root

RUN pip install --upgrade pip
RUN pip install trino

COPY docker-init.sh /opt/bin/docker-init.sh
RUN chmod +x /opt/bin/docker-init.sh
USER superset
