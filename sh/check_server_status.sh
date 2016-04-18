#!/bin/sh

# check the status
ssh -i 391winter.pem ubuntu@10.2.3.31 "/home/ubuntu/cassandra/apache-cassandra/bin/nodetool status"
# ssh -i 391winter.pem ubuntu@10.2.2.187 "/home/ubuntu/cassandra/apache-cassandra-2.0.5/bin/nodetool status"
