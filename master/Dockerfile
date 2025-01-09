FROM bde2020/spark-base:3.3.0-hadoop3.3

LABEL maintainer="Alejandro Perez <sakacel2@gmail.com>"

COPY master.sh /

RUN apt-get update && apt-get install -y \
    openjdk-8-jdk

# Configurar variables de entorno
ENV SPARK_HOME=/spark
ENV PATH=$SPARK_HOME/bin:$PATH
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk
ENV PATH=$JAVA_HOME/bin:$PATH

ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8080
ENV SPARK_MASTER_LOG /spark/logs

EXPOSE 8080 7077 6066

CMD ["/bin/bash", "/master.sh"]
