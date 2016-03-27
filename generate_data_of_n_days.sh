#!/bin/sh

ssh -i 391winter.pem ubuntu@10.2.3.31 "/home/ubuntu/cassandra/apache-cassandra-2.0.5/bin/cqlsh -f setup.cql"

echo "Enter the number of days, followed by [ENTER]:"
read days

echo "Generating data of $days days ..."
ssh -i 391winter.pem ubuntu@10.2.3.31 "python generate.py $days"
