FROM asamerh4/mesos-batch:f7ea7a1

MAINTAINER Hubert Asamer

RUN pip install --upgrade pip && pip install --upgrade awscli && pip install certifi pyspark
RUN curl http://ftp.halifax.rwth-aachen.de/apache/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz | tar -xzC /opt && mv /opt/spark* /opt/spark

RUN curl http://downloads.alluxio.org/downloads/files/1.6.0/alluxio-1.6.0-hadoop-2.7-bin.tar.gz | tar -xzC /opt && mv /opt/alluxio* /opt/alluxio