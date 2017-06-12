# Base docker file for Hadoop and other containers.
# FIXME: Still uses insecure curl.

FROM debian:jessie

# FIXME: Could not get multi-line ENV to work.
ENV JAVA_MAJOR=8
ENV JAVA_MINOR=131
ENV JAVA_BUILD=b11
ENV JAVA_LOC_HASH=d54c1d3a095b4ff2b6607d096fa80163
ENV JAVA_VERSION=${JAVA_MAJOR}u${JAVA_MINOR}
ENV JAVA_HOME=/opt/jdk1.8.0_$JAVA_MINOR
ENV JDK_DL_URL=http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}-$JAVA_BUILD/${JAVA_LOC_HASH}/jdk-$JAVA_VERSION-linux-x64.tar.gz
ENV HADOOP_VERSION=2.7.3
ENV HADOOP_URL=https://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz
ENV HADOOP_PREFIX=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV MULTIHOMED_NETWORK=1
ENV USER=root
ENV PATH=$JAVA_HOME/bin:$HADOOP_PREFIX/bin/:$PATH

COPY files/common.sh \
     files/inject_hadoop_cfg.sh \
     files/hadoop-entrypoint.sh /entrypoints/

# Install tools, JAVA, Hadoop.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    net-tools \
    curl \
    wget \
    unzip \
    tar \
    bzip2 \
    netcat \
    && curl --retry 3 -k -L -C - -b "oraclelicense=accept-securebackup-cookie" -O "$JDK_DL_URL" \
    && tar xvf jdk-$JAVA_VERSION-linux-x64.tar.gz -C /opt/  \
    && ln -s $JAVA_HOME /opt/java \
    && rm jdk-$JAVA_VERSION-linux-x64.tar.gz \
    && set -x \
    && curl -kfSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
    && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
    && rm /tmp/hadoop.tar.gz* \
    && ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop \
    && cp /etc/hadoop/mapred-site.xml.template /etc/hadoop/mapred-site.xml \
    && mkdir /opt/hadoop-$HADOOP_VERSION/logs \
    && mkdir /hadoop-data \
    && chmod a+x /entrypoints/hadoop-entrypoint.sh

ENTRYPOINT ["/entrypoints/hadoop-entrypoint.sh"]
