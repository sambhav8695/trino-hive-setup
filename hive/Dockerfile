FROM apache/hive:4.0.0

USER root
RUN apt-get update && apt-get install -y wget netcat

RUN wget -P /opt/hive/lib \
    "https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.28/mysql-connector-java-8.0.28.jar"
RUN wget -P /opt/hive/lib \
    "https://repo1.maven.org/maven2/org/postgresql/postgresql/42.7.3/postgresql-42.7.3.jar"

# google storage
RUN wget -P /opt/hadoop/share/hadoop/tools/lib \ 
    "https://storage.googleapis.com/hadoop-lib/gcs/gcs-connector-hadoop2-latest.jar"

COPY ./docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER hive
