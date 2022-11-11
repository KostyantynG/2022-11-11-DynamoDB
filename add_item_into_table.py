import boto3
import requests

dynamo = boto3.resource('dynamodb')
table = dynamo.Table('Jobs')
url = "https://www.arbeitnow.com/api/job-board-api"

def get_raw_jobs():    
    response = requests.get(url)
    return response.json()["data"]

def upload_jobs_to_db():
    raw_jobs = get_raw_jobs()
    for job_api in raw_jobs:
        table.put_item(
            Item={
            "id": job_api["slug"],
            "title": job_api["title"],
            "description": job_api["description"]
        })
upload_jobs_to_db()