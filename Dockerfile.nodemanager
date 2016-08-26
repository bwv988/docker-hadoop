# Dockerfile for Hadoop nodemanager.

FROM analytics/hadoop-base

COPY files/nodemanager-run.sh /nodemanager-run.sh
RUN chmod a+x /nodemanager-run.sh

CMD ["/nodemanager-run.sh"]
