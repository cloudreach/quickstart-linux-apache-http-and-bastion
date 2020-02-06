#!/bin/bash

AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}

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

aws cloudformation describe-stacks --stack-name ${STACK_NAME}
