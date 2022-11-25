import boto3

dynamodb = boto3.resource('dynamodb', region_name='us-west-2')
table = dynamodb.Table('Jobs')
response = table.scan()
jobs_list = response['Items']


def check_for_word():
    print(jobs_list[0])
    for job in jobs_list:
        for attribute in job:
            if "aws" or "AWS" in job[attribute]:
                print(job[attribute])
    # words_list = sentence.split()
    # for word in words_list:
    #     if word == "AWS":
    #         print("Your job has AWS in it")

check_for_word()