# Hadoop Docker

This is a Debian Jessie-based dockerized Hadoop environment.

## Building

## Usage Examples

For the examples below, `docker-compose` must be installed.

### Starting and Stopping the Cluster

#### Basic Cluster -- 1 Namenode + 1 Datanode

```bash
docker-compose -f docker-compose/docker-compose-basic.yml up
```

```bash
docker-compose -f docker-compose/docker-compose-basic.yml stop && docker-compose -f docker-compose/docker-compose-basic.yml rm
```

#### Full Hadoop Cluster

```bash
docker-compose -f docker-compose/docker-compose-full.yml up
```

```bash
docker-compose -f docker-compose/docker-compose-full.yml stop && docker-compose -f docker-compose/docker-compose-full.yml rm
```

### Accessing the Namenode UI:

<http://localhost:50070/>

### Using the Hadoop CLI to create directories and load files into HDFS.

The below commands demonstrate how to create a directory in the Hadoop cluster and copy a file from the host into HDFS.

```
./hadoop.sh fs -ls /
./hadoop.sh fs -mkdir /tmp
./hadoop.sh fs -ls /
echo "Hello world" > test.txt
sudo mv test.txt docker-compose/data/exchange/
./hadoop.sh fs -put /exchange/test.txt /tmp/test.txt
./hadoop.sh fs -ls /tmp
```
