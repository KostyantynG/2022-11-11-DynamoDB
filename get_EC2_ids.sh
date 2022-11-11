#!/bin/bash

echo "id1=`aws ec2 describe-instances --filters Name=availability-zone,Values=us-west-2a \
    Name=instance-state-name,Values=running --query "Reservations[*].Instances[*].[InstanceId]" \
    --output text`" >> $GITHUB_ENV
echo "id2=`aws ec2 describe-instances --filters Name=availability-zone,Values=us-west-2b \
    Name=instance-state-name,Values=running --query "Reservations[*].Instances[*].[InstanceId]" \
    --output text`" >> $GITHUB_ENV