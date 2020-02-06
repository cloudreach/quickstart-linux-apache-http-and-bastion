#!/bin/bash

AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}

echo "Submitting CloudFormation Template..."

aws cloudformation create-stack --stack-name ${STACK_NAME} \
-- MOTD ${MOTD} \
--template-body file://blueprint/templates/linux-apache-http-master.template \
 --capabilities CAPABILITY_IAM


echo "Waiting for resources to provision (this may take up to 30 minutes)..."

aws cloudformation wait stack-create-complete --stack-name ${STACK_NAME}

echo "Blueprint has been deployed..."

aws cloudformation describe-stacks --stack-name ${STACK_NAME}
