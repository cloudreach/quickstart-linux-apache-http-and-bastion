#!/bin/bash

AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}
TOPIC_ARN="arn:aws:sns:eu-west-1:077319295051:build-notifications"
EMAIL=${EMAIL_ADDRESS}
aws sns subscribe --topic-arn ${TOPIC_ARN} \
--protocol email \
--notification-endpoint ${EMAIL}

echo "Submitting CloudFormation Template..."


#aws cloudformation create-stack --stack-name ${STACK_NAME} \
#-- MOTD ${MOTD} \
#--template-body file://blueprint/templates/linux-apache-http-master.template \
# --capabilities CAPABILITY_IAM

aws cloudformation deploy --stack-name ${STACK_NAME} \
--template-file blueprint/templates/linux-apache-http-master.template \
--parameter-overrides MOTD="${MOTD}" \
--capabilities CAPABILITY_IAM

echo "Blueprint has been deployed..."
aws sns publish --topic-arn ${TOPIC_ARN} \
--message "Deployment of stack ${STACK_NAME} is complete. http://www.bramblesdemo.aws.crlabs.cloud/" \
--subject "Deployment Complete"
aws cloudformation describe-stacks --stack-name ${STACK_NAME}
