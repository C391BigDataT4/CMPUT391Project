#!/bin/sh

# ssh -i 391winter.pem ubuntu@10.2.3.31 "/home/ubuntu/cassandra/apache-cassandra-2.0.5/bin/nodetool cfstats group4"

ssh -i 391winter.pem ubuntu@10.2.3.31 "df -h | grep /dev/vdc"
ssh -i 391winter.pem ubuntu@10.2.3.30 "df -h | grep /dev/vdc"
ssh -i 391winter.pem ubuntu@10.2.3.5 "df -h | grep /dev/vdc"
