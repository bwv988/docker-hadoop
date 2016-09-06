# Dockerfile for Hadoop historyserver.
FROM bwv988/hadoop-base

ENV YARN_CONF_yarn_timeline___service_leveldb___timeline___store_path=/hadoop/yarn/timeline
RUN mkdir -p /hadoop/yarn/timeline
VOLUME /hadoop/yarn/timeline

COPY files/historyserver-run.sh /entrypoints/historyserver-run.sh
RUN chmod a+x /entrypoints/historyserver-run.sh

CMD ["/entrypoints/historyserver-run.sh"]
