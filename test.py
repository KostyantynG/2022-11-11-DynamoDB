import boto3

dynamodb = boto3.resource('dynamodb', region_name='us-west-2')
table = dynamodb.Table('Jobs')
response = table.scan()
jobs_list = response['Items']
print(jobs_list[0])
# def check_for_word():
#     for job in jobs_list:
#         words_list = job['description'].split()
#         for word in words_list:
#             if word == "aws" or word == "AWS":
#                 print(job['id'])
    # words_list = sentence.split()
    # for word in words_list:
    #     if word == "AWS":
    #         print("Your job has AWS in it")

# check_for_word()