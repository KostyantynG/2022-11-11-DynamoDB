from fastapi import FastAPI
import uvicorn
import boto3

# Create fastapi
app = FastAPI()

# Get list of jobs
dynamodb = boto3.resource('dynamodb', region_name='us-west-2')
table = dynamodb.Table('Jobs')
response = table.scan()
jobs_list = response['Items']


# Get health check (root directory)
@app.get("/")
def root():
    return {"Health check" : "OK"}

# Get list of jobs
@app.get("/job")
def list_jobs():
    return jobs_list

# Get job by ID
@app.get("/job/{job_id}")
def get_by_id(job_id):
    for job in jobs_list:
        if job["id"] == job_id:
            return job

# Run code with Python
if __name__ == "__main__":
   uvicorn.run(app, host="0.0.0.0", port=80)