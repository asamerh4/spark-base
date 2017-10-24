#!/bin/bash

SPARKMASTER=${SPARKMASTER:-local}
MESOSEXECUTORCORE=${MESOSEXECUTORCORE:-0.1}
SPARKIMAGE=${SPARKIMAGE:-spark-base:latest}
CURRENTIP=$(hostname -i)

sed -i 's;SPARKMASTER;'$SPARKMASTER';g' /opt/spark/conf/spark-defaults.conf
sed -i 's;MESOSEXECUTORCORE;'$MESOSEXECUTORCORE';g' /opt/spark/conf/spark-defaults.conf
sed -i 's;SPARKIMAGE;'$SPARKIMAGE';g' /opt/spark/conf/spark-defaults.conf
sed -i 's;CURRENTIP;'$CURRENTIP';g' /opt/spark/conf/spark-defaults.conf

export SPARKLOCALIP=${SPARKLOCALIP:-${CURRENTIP:-"127.0.0.1"}}
export SPARKPUBLICDNS=${SPARKPUBLICDNS:-${CURRENTIP:-"127.0.0.1"}}


if [ $ADDITIONALVOLUMES ];
then
echo "spark.mesos.executor.docker.volumes: $ADDITIONALVOLUMES" >> /opt/spark/conf/spark-defaults.conf
fi

exec "$@"
