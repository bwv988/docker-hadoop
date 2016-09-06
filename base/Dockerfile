# Base docker file for Hadoop and other containers.
# FIXME: Temporarily added -k option for curl & disabled GPG verification. This is insecure!

FROM debian:jessie

# Install some useful tools.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    net-tools \
    curl \
    wget \
    unzip \
    tar \
    bzip2 \
    netcat

# Install Oracle JDK.
# FIXME: Use same download sequence as for Hadoop below. Remove downloaded .tar.gz.
ENV JAVA_MAJOR 8
ENV JAVA_MINOR 101
ENV JAVA_BUILD b13
ENV JAVA_VERSION ${JAVA_MAJOR}u${JAVA_MINOR}
ENV JDK_DL_URL http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}-$JAVA_BUILD/jdk-$JAVA_VERSION-linux-x64.tar.gz
RUN curl -sL --retry 3 --insecure \
  --header "Cookie: oraclelicense=accept-securebackup-cookie" \
  "$JDK_DL_URL" \
  | gunzip \
  | tar x -C /opt/
ENV JAVA_HOME /opt/jdk1.8.0_$JAVA_MINOR
RUN ln -s $JAVA_HOME /opt/java
ENV PATH $JAVA_HOME/bin:$PATH


ENV HADOOP_VERSION 2.7.2
ENV HADOOP_URL https://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz
RUN set -x \
    && curl -kfSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
    && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
    && rm /tmp/hadoop.tar.gz*

RUN ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop \
 && cp /etc/hadoop/mapred-site.xml.template /etc/hadoop/mapred-site.xml \
 && mkdir /opt/hadoop-$HADOOP_VERSION/logs \
 && mkdir /hadoop-data \
 && mkdir /entrypoints

ENV HADOOP_PREFIX=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV MULTIHOMED_NETWORK=1

ENV USER=root
ENV PATH $HADOOP_PREFIX/bin/:$PATH

COPY files/common.sh /entrypoints/common.sh
COPY files/inject_hadoop_cfg.sh /entrypoints/inject_hadoop_cfg.sh
COPY files/hadoop-entrypoint.sh /entrypoints/hadoop-entrypoint.sh
RUN chmod a+x /entrypoints/hadoop-entrypoint.sh

ENTRYPOINT ["/entrypoints/hadoop-entrypoint.sh"]
