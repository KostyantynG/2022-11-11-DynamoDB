#!/bin/bash

BUCKET_NAME=arbeitnow-job-bucket
REGION=us-west-2
if aws s3 ls "s3://$BUCKET_NAME" 2>&1 | grep -q 'An error occurred'
then
    aws s3api create-bucket --bucket $BUCKET_NAME --region $REGION --create-bucket-configuration LocationConstraint=$REGION
else
    echo "Bucket already exists"
fi
