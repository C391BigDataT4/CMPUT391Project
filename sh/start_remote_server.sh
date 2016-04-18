#!/bin/sh

# start cassandra on all nodes
ssh -i 391winter.pem ubuntu@10.2.3.31 "/home/ubuntu/cassandra/apache-cassandra/bin/cassandra" &
ssh -i 391winter.pem ubuntu@10.2.3.30 "/home/ubuntu/cassandra/apache-cassandra/bin/cassandra" &
ssh -i 391winter.pem ubuntu@10.2.3.5 "/home/ubuntu/cassandra/apache-cassandra/bin/cassandra" &

# ssh -i 391winter.pem ubuntu@10.2.2.187 "/home/ubuntu/cassandra/apache-cassandra-2.0.5/bin/cassandra" &
# ssh -i 391winter.pem ubuntu@10.2.2.180 "/home/ubuntu/cassandra/apache-cassandra-2.0.5/bin/cassandra" &
# ssh -i 391winter.pem ubuntu@10.2.0.157 "/home/ubuntu/cassandra/apache-cassandra-2.0.5/bin/cassandra" &

sleep 40
