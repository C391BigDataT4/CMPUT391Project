#!/bin/sh

# upload "generate.py" to node 1
scp -i 391winter.pem generate.py ubuntu@10.2.3.31:~

echo "Enter the number of days, followed by [ENTER]:"
read days

echo "Generating data of $days days ..."
ssh -i 391winter.pem ubuntu@10.2.3.31 "python generate.py $days"
