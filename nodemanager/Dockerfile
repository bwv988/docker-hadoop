# Dockerfile for Hadoop nodemanager.

FROM analytics/hadoop-base

COPY nodemanager-run.sh /nodemanager-run.sh
RUN chmod a+x /nodemanager-run.sh

CMD ["/nodemanager-run.sh"]
