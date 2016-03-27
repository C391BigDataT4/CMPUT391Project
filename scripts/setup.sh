#!/bin/sh

# upload files to node 1
scp -i 391winter.pem cql/setup.cql cql/columns.cql ubuntu@10.2.3.31:~

ssh -i 391winter.pem ubuntu@10.2.3.31 "/home/ubuntu/cassandra/apache-cassandra-2.0.5/bin/cqlsh -f setup.cql"
