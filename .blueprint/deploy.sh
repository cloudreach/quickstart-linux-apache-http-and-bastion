#!/bin/bash

STACK_NAME=${STACK_NAME}

echo "Submitting CloudFormation Template..."

aws cloudformation create-stack --stack-name ${STACK_NAME} \
--template-body file://blueprint/templates/linux-bastion-master.template \
--parameters \
	ParameterKey=FunctionName,ParameterValue=$FunctionName \
 --capabilities CAPABILITY_IAM

echo "Waiting for resources to provision (this may take up to 30 minutes)..."

aws cloudformation wait stack-create-complete --stack-name ${STACK_NAME}

echo "Blueprint has been deployed..."

aws cloudformation describe-stacks --stack-name ${STACK_NAME}
