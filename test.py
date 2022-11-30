import boto3

dynamodb = boto3.resource('dynamodb', region_name='us-west-2')
table = dynamodb.Table('Jobs')
response = table.scan()
jobs_list = response['Items']

def check_for_word(newImage):
    title = newImage["title"]
    description = newImage["description"]
    if "aws" in title.lower() or "aws" in description.lower():
        print(title)
        print(job['id'])
for job in jobs_list:
    check_for_word(job)