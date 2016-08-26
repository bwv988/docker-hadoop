# Dockerfile for Hadoop resourcemanager.

FROM analytics/hadoop-base

COPY files/resourcemanager-run.sh /resourcemanager-run.sh
RUN chmod a+x /resourcemanager-run.sh

CMD ["/resourcemanager-run.sh"]
