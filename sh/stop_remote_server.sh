#!/bin/sh

# kill cassandra on all nodes
ssh -i 391winter.pem ubuntu@10.2.3.5 "pgrep -u ubuntu -f cassandra | xargs kill -9"
ssh -i 391winter.pem ubuntu@10.2.3.30 "pgrep -u ubuntu -f cassandra | xargs kill -9"
ssh -i 391winter.pem ubuntu@10.2.3.31 "pgrep -u ubuntu -f cassandra | xargs kill -9"

# ssh -i 391winter.pem ubuntu@10.2.2.180 "pgrep -u ubuntu -f cassandra | xargs kill -9"
# ssh -i 391winter.pem ubuntu@10.2.2.187 "pgrep -u ubuntu -f cassandra | xargs kill -9"
# ssh -i 391winter.pem ubuntu@10.2.0.157 "pgrep -u ubuntu -f cassandra | xargs kill -9"
