# Dockerfile for Hadoop resourcemanager.

FROM bwv988/hadoop-base

COPY files/resourcemanager-run.sh /entrypoints/resourcemanager-run.sh
RUN chmod a+x /entrypoints/resourcemanager-run.sh

CMD ["/entrypoints/resourcemanager-run.sh"]
