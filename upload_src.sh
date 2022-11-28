#!bin/bash

mkdir build

echo "zip files for server"
cd api-server
zip ../build/script.zip requirements.txt
zip -r ../build/script.zip src 
cd ..

echo  "upload code to s3"
aws s3 cp build/script.zip s3://arbeitnow-job-bucket/script.zip

mkdir terraform/build

cd job-data-crawler/src
zip -r ../../terraform/build/job_crawler.zip .
cd ../..

cd notifier/src
zip -r ../../terraform/build/notifier.zip .
cd ../..

cd requests-layer
pip3 install -r requirements.txt --target python/lib/python3.9/site-packages
zip -r ../build/requests_layer.zip .
cd ..

echo  "upload layer to s3"
aws s3 cp build/requests_layer.zip s3://arbeitnow-job-bucket/