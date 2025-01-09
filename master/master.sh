#!/bin/bash

export SPARK_MASTER_HOST=${SPARK_MASTER_HOST:-`hostname`}



export SPARK_HOME=/spark >> ~/.bashrc
export PATH=$SPARK_HOME/bin:$PATH >> ~/.bashrc

. "/spark/sbin/spark-config.sh"

. "/spark/bin/load-spark-env.sh"

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk >> ~/.bashrc
export PATH=$JAVA_HOME/bin:$PATH >> ~/.bashrc

source ~/.bashrc

mkdir -p $SPARK_MASTER_LOG

ln -sf /dev/stdout $SPARK_MASTER_LOG/spark-master.out

cd /spark/bin && /spark/sbin/../bin/spark-class org.apache.spark.deploy.master.Master \
    --ip $SPARK_MASTER_HOST --port $SPARK_MASTER_PORT --webui-port $SPARK_MASTER_WEBUI_PORT >> $SPARK_MASTER_LOG/spark-master.out
