#!/bin/bash

if [[ ${{ env.id1 }} != "" && ${{ env.id2 }} != "" ]]
then
    echo "Terminating instances..."
    aws ec2 terminate-instances --instance-ids ${{ env.id1 }} ${{ env.id2 }}
fi