#!/bin/sh

# reset database. All data in keyspace "group4" will be remove.
ssh -i 391winter.pem ubuntu@10.2.3.31 "/home/ubuntu/cassandra/apache-cassandra-2.0.5/bin/cqlsh -f setup.cql"
