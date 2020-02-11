import json
import boto3

def lambda_handler(event, context):
    client = boto3.client('cloudformation')
    response = client.list_stacks(
        StackStatusFilter=[
            'CREATE_COMPLETE', 'CREATE_FAILED', 'ROLLBACK_COMPLETE'
        ]
    )
    stacks = [x['StackName'] for x in response['StackSummaries'] if not x.get(
        'ParentId', None) and 'StackSet-AWS-Landing-Zone-Baseline' not in x['StackName']]
    for stack in stacks:
        print(f'Deleteing Stack {stack}')
        client.delete_stack(StackName=stack)
    return stacks