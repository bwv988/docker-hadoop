# Dockerfile for Hadoop datanode.

FROM analytics/hadoop-base

ENV HDFS_CONF_dfs_datanode_data_dir=file:///hadoop/dfs/data
RUN mkdir -p /hadoop/dfs/data
VOLUME /hadoop/dfs/data

COPY files/datanode-run.sh /entrypoints/datanode-run.sh
RUN chmod a+x /entrypoints/datanode-run.sh

CMD ["/entrypoints/datanode-run.sh"]
