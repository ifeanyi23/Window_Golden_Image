# aws cloudformation create-stack --stack-name windows-iis-stack --template-body file://windows-server-2022-with-iis.yml --capabilities CAPABILITY_NAMED_IAM --region us-west-2 --profile Joseph
export STACK_ID=$(
  aws cloudformation create-stack \
    --stack-name $STACK_NAME \
    --template-body file://cf-pipeline.yml \
    --parameters \
    ParameterKey=InitialCodeBucketName,ParameterValue=$BUCKET_NAME \
    ParameterKey=Subnets,ParameterValue=$SUBNETS \
    --capabilities CAPABILITY_IAM \
    --output text \
    --query StackId \
    --profile Admin)
aws cloudformation wait stack-create-complete --stack-name $STACK_ID

# git config --global --edit  