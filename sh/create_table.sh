#!/bin/sh

echo "Creating table..."
ssh -i 391winter.pem ubuntu@10.2.3.31 "/home/ubuntu/cassandra/apache-cassandra/bin/cqlsh 10.2.3.31 -f setup.cql"
# ssh -i 391winter.pem ubuntu@10.2.2.187 "/home/ubuntu/cassandra/bin/cqlsh -f setup.cql"
echo "Done."
