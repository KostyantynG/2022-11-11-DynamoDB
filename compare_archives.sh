#!/bin/bash

echo "compare=`diff <(unzip -vqq script.zip | awk '{$2=""; $3=""; $4=""; $5=""; $6=""; print}' | sort -k3) <(unzip -vqq script1.zip | awk '{$2=""; $3=""; $4=""; $5=""; $6=""; print}' | sort -k3)`" >> $GITHUB_ENV