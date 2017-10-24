FROM asamerh4/mesos-batch:f7ea7a1

MAINTAINER Hubert Asamer

RUN yum clean all && touch /var/lib/rpm/* &&  yum -y install java-openjdk && pip install --upgrade pip && pip install --upgrade awscli && pip install certifi pyspark && curl http://ftp.halifax.rwth-aachen.de/apache/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz | tar -xzC /opt && mv /opt/spark* /opt/spark && mkdir /opt/alluxio && mkdir -p /opt/spark/custom/lib && curl http://downloads.alluxio.org/downloads/files/1.6.0/alluxio-1.6.0-hadoop-2.7-bin.tar.gz | tar -xzC /opt && mv /opt/alluxio*/core/client/runtime/target/alluxio-core-client-runtime-1.6.0-jar-with-dependencies.jar /opt/spark/custom/lib  && rm -rf /opt/alluxio*/

COPY spark-conf/* /opt/spark/conf/
COPY scripts /scripts

ENV SPARKHOME /opt/spark

ENTRYPOINT ["/scripts/run.sh"]
