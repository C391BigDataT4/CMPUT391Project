#!/bin/sh

# ssh -i 391winter.pem ubuntu@10.2.3.31 "/home/ubuntu/cassandra/bin/nodetool cfstats group4"

ssh -i 391winter.pem ubuntu@10.2.3.31 "df -h | grep /dev/vdc"
ssh -i 391winter.pem ubuntu@10.2.3.30 "df -h | grep /dev/vdc"
ssh -i 391winter.pem ubuntu@10.2.3.5 "df -h | grep /dev/vdc"
# ssh -i 391winter.pem ubuntu@10.2.2.187 "df -h | grep /dev/vdc"
# ssh -i 391winter.pem ubuntu@10.2.2.180 "df -h | grep /dev/vdc"
# ssh -i 391winter.pem ubuntu@10.2.0.157 "df -h | grep /dev/vdc"
