from fastapi import FastAPI
import uvicorn
import json
import boto3

client = boto3.client('dynamodb')
response = client.query(
    TableName='Jobs',
    KeyConditions={
        'string': {
            'AttributeValueList': [
                {
                    'S': 'string'
                }
            ]
        }
    }
)
print(response)
# dynamodb = boto3.resource('dynamodb')
# table = dynamodb.Table('Jobs')
# response = table.scan(
#     FilterExpression='string',
#     ExpressionAttributeValues={
#         'string': {
            
#         },
#     }
# )
# data = response['Items']



# while 'LastEvaluatedKey' in response:
#     response = table.scan(ExclusiveStartKey=response['LastEvaluatedKey'])
#     data.extend(response['Items'])
# print(data)

# response = table.query(
#     TableName='Jobs',
#     Key={
#         'id': {'S': 'ausbildung-handelsfachwirt-in-jena-jysk-206765'},
#         'title': {'S': 'AUSBILDUNG HANDELSFACHWIRT/IN (M/W/D) – Jena'}
#     }
# )

# job_id = response['Item']['id']['S']
# job_title = response['Item']['title']['S']
# job_description = response['Item']['description']['S']

# job_example = {
#     "id" : job_id,
#     "title" : job_title,
#     "description" : job_description
# }

# Create fastapi
# app = FastAPI()

# # Get health check (root directory)
# @app.get("/")
# def root():
#     return {"Health check" : "OK"}

# # Get list of jobs
# @app.get("/job")
# def list_jobs():
#     return data

# # # Get job by ID
# # @app.get("/job/{job_id}")
# # def get_by_id(job_id):
# #     for job in jobs:
# #         if job["id"] == job_id:
# #             return job

# # Run code with Python
# if __name__ == "__main__":
#    uvicorn.run(app, port=3000)
