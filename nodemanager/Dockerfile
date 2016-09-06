# Dockerfile for Hadoop nodemanager.

FROM bwv988/hadoop-base

COPY files/nodemanager-run.sh /entrypoints/nodemanager-run.sh
RUN chmod a+x /entrypoints/nodemanager-run.sh

CMD ["/entrypoints/nodemanager-run.sh"]
