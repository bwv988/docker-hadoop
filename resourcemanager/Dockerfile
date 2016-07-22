# Dockerfile for Hadoop resourcemanager.

FROM analytics/hadoop-base

COPY resourcemanager-run.sh /resourcemanager-run.sh
RUN chmod a+x /run.sh

CMD ["/resourcemanager-run.sh"]
