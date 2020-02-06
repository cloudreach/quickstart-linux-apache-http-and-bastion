#!/bin/bash

AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}
TOPIC_ARN="arn:aws:sns:eu-west-1:077319295051:build-notifications"

echo "Destroying CloudFormation Stack..."

aws cloudformation delete-stack --stack-name ${STACK_NAME} \
 --region eu-west-1

echo "Waiting for CloudFormation stack to destroy..."

aws cloudformation wait stack-delete-complete --stack-name ${STACK_NAME} \
 --region eu-west-1

echo "Blueprint has been destroyed..."
aws sns publish --topic-arn ${TOPIC_ARN} \
--message "Destroy of stack ${STACK_NAME} is complete." \
--subject "Stack Destroy Complete"
