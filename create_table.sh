#!/bin/sh

echo "Creating table..."
ssh -i 391winter.pem ubuntu@10.2.3.31 "/home/ubuntu/cassandra/apache-cassandra-2.0.5/bin/cqlsh -f setup.cql"
echo "Done."
