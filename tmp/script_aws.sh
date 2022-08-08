#!/bin/bash

DATE=$(date +%F_%H-%M-%S)
DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
AWS_SECRET=$4
BUCKET_NAME=$5
 
mysqldump --column-statistics=0 -u root -h $DB_HOST -p$DB_PASSWORD $DB_NAME > /tmp/db-$DATE.sql && \
export AWS_ACCESS_KEY_ID=AKIAY5BMGQ2CG4L2H6Q2 && \
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET && \
aws s3 cp /tmp/db-$DATE.sql s3://$BUCKET_NAME
