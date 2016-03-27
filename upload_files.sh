#!/bin/sh

# upload files to node 1
scp -i 391winter.pem cql/setup.cql cql/columns.cql generate.py ubuntu@10.2.3.31:/home/ubuntu/
echo "Files for generating data uploaded to node 1."

# upload settings to all nodes
scp -i 391winter.pem conf/cassandra.yaml ubuntu@10.2.3.31:/home/ubuntu/cassandra/apache-cassandra-2.0.5/conf/cassandra.yaml
scp -i 391winter.pem conf/cassandra.yaml ubuntu@10.2.3.30:/home/ubuntu/cassandra/apache-cassandra-2.0.5/conf/cassandra.yaml
scp -i 391winter.pem conf/cassandra.yaml ubuntu@10.2.3.5:/home/ubuntu/cassandra/apache-cassandra-2.0.5/conf/cassandra.yaml
echo "Cassandra configuration uploaded to all noeds. Please restart Cassandra."
