#!/bin/sh

echo "Stopping the server..."
sh stop_remote_server.sh
echo "Server stopped."

# reset database. All data in keyspace "group4" will be remove.
ssh -i 391winter.pem ubuntu@10.2.3.31 "rm -rf /mystorage/cassandra/"
ssh -i 391winter.pem ubuntu@10.2.3.30 "rm -rf /mystorage/cassandra/"
ssh -i 391winter.pem ubuntu@10.2.3.5 "rm -rf /mystorage/cassandra/"

# upload files to node 1
echo "Uploading files..."
scp -i 391winter.pem cql/setup.cql cql/columns.cql generate.py ubuntu@10.2.3.31:/home/ubuntu/

# upload settings to all nodes
scp -i 391winter.pem conf/cassandra_node_1.yaml ubuntu@10.2.3.31:/home/ubuntu/cassandra/apache-cassandra-2.0.5/conf/cassandra.yaml
scp -i 391winter.pem conf/cassandra_node_2.yaml ubuntu@10.2.3.30:/home/ubuntu/cassandra/apache-cassandra-2.0.5/conf/cassandra.yaml
scp -i 391winter.pem conf/cassandra_node_3.yaml ubuntu@10.2.3.5:/home/ubuntu/cassandra/apache-cassandra-2.0.5/conf/cassandra.yaml
echo "Cassandra configuration uploaded to all noeds. Please restart Cassandra."
