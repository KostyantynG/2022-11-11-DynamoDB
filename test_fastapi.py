import json
import boto3

dynamodb = boto3.resource('dynamodb', region_name = 'us-west-2')
table = dynamodb.Table('Jobs')
response = table.query(
    KeyConditions={
        'id': {
            'AttributeValueList': [
                'id',
                'head-of-it-horsemapp-gmbh-munich-300069'
            ],
            'ComparisonOperator': 'CONTAINS'
        }
    }
)
print(response)
# def find_aws_job():
#     for job in jobs_list:
#         if job["description"] == "*aws*":
#             print(job)



# def lambda_handler(event, context):
#     client = boto3.client('sns')
#     snsArn = 'arn:aws:sns:us-west-2:874515606678:aws_jobs_notifier'
#     msg = 
#     client.publish(
#         TopicArn = snsArn,
#         Message = msg,
#         Subject='AWS job alert'
#     )
    