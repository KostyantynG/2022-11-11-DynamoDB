#!/bin/bash

BUCKET_NAME_BACKEND=scaling-fastapi-backend
REGION=us-west-2
if aws s3 ls "s3://$BUCKET_NAME_BACKEND" 2>&1 | grep -q 'An error occurred'
then
    aws s3api create-bucket --bucket $BUCKET_NAME_BACKEND --region $REGION --create-bucket-configuration LocationConstraint=$REGION
else
    echo "Bucket already exists"
fi
