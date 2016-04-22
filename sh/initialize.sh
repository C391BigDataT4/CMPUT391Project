#!/bin/sh

# echo "Stopping the server..."
# sh stop_remote_server.sh
# echo "Server stopped."

# reset database. All data in keyspace "group4" will be remove.
# ssh -i 391winter.pem ubuntu@10.2.3.31 "rm -rf /mystorage/cassandra/"
# ssh -i 391winter.pem ubuntu@10.2.3.30 "rm -rf /mystorage/cassandra/"
# ssh -i 391winter.pem ubuntu@10.2.3.5 "rm -rf /mystorage/cassandra/"
# ssh -i 391winter.pem ubuntu@10.2.2.187 "rm -rf /mystorage/cassandra/"
# ssh -i 391winter.pem ubuntu@10.2.2.180 "rm -rf /mystorage/cassandra/"
# ssh -i 391winter.pem ubuntu@10.2.0.157 "rm -rf /mystorage/cassandra/"

# upload files to node 1
echo "Uploading files..."
scp -i 391winter.pem cql/setup.cql cql/columns.cql generate/generate.c insert.py query.py ubuntu@10.2.3.31:/home/ubuntu/
# scp -i 391winter.pem cql/setup.cql cql/columns.cql generate/generate.c insert.py query.py ubuntu@10.2.3.30:/home/ubuntu/
# scp -i 391winter.pem cql/setup.cql cql/columns.cql generate/generate.c insert.py query.py ubuntu@10.2.3.5:/home/ubuntu/
# scp -i 391winter.pem cql/setup.cql cql/columns.cql generate/generate.c insert.py ubuntu@10.2.2.187:/home/ubuntu/
# scp -i 391winter.pem cql/setup.cql cql/columns.cql generate/generate.c insert.py ubuntu@10.2.2.180:/home/ubuntu/
# scp -i 391winter.pem cql/setup.cql cql/columns.cql generate/generate.c insert.py ubuntu@10.2.0.157:/home/ubuntu/

# upload settings to all nodes
scp -i 391winter.pem conf/cassandra.yaml ubuntu@10.2.3.31:/home/ubuntu/cassandra/apache-cassandra/conf/cassandra.yaml
scp -i 391winter.pem conf/cassandra.yaml ubuntu@10.2.3.30:/home/ubuntu/cassandra/apache-cassandra/conf/cassandra.yaml
scp -i 391winter.pem conf/cassandra.yaml ubuntu@10.2.3.5:/home/ubuntu/cassandra/apache-cassandra/conf/cassandra.yaml
# scp -i 391winter.pem conf/cassandra.yaml ubuntu@10.2.2.187:/home/ubuntu/cassandra/apache-cassandra-2.0.5/conf/cassandra.yaml
# scp -i 391winter.pem conf/cassandra.yaml ubuntu@10.2.2.180:/home/ubuntu/cassandra/apache-cassandra-2.0.5/conf/cassandra.yaml
# scp -i 391winter.pem conf/cassandra.yaml ubuntu@10.2.0.157:/home/ubuntu/cassandra/apache-cassandra-2.0.5/conf/cassandra.yaml
echo "Cassandra configuration uploaded to all nodes. Please restart Cassandra."

# compile generator
echo "Compiling generator..."
ssh -i 391winter.pem ubuntu@10.2.3.31 "gcc /home/ubuntu/generate.c -o /home/ubuntu/generate"
# ssh -i 391winter.pem ubuntu@10.2.3.30 "gcc /home/ubuntu/generate.c -o /home/ubuntu/generate"
# ssh -i 391winter.pem ubuntu@10.2.3.5 "gcc /home/ubuntu/generate.c -o /home/ubuntu/generate"
# ssh -i 391winter.pem ubuntu@10.2.2.187 "gcc /home/ubuntu/generate.c -o /home/ubuntu/generate"
# ssh -i 391winter.pem ubuntu@10.2.2.180 "gcc /home/ubuntu/generate.c -o /home/ubuntu/generate"
# ssh -i 391winter.pem ubuntu@10.2.0.157 "gcc /home/ubuntu/generate.c -o /home/ubuntu/generate"
echo "Done compiling."
