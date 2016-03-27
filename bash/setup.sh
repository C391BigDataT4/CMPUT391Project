#!/bin/sh

# upload the necessary files to node 1
scp -i 391winter.pem ../cql/setup.cql ../cql/columns.cql generate.py ubuntu@10.2.3.31:~

# reset database. This will drop the whole keyspace. All data will be removed.
ssh -i 391winter.pem ubuntu@10.2.3.31 "/home/ubuntu/cassandra/apache-cassandra-2.0.5/bin/cqlsh -f setup.cql"
