export STACK_NAME=Demo
export BUCKET_NAME=joes-bucket-97

# Vpc subnet that can be used to spin up EC2 instances, seclets the subnets from the default VPC

export SUBNETS=$( \
  echo $( \
    aws ec2 describe-subnets \
      --output text \
      --query 'Subnets[?DefaultForAz==`true`].SubnetId' \
      --profile Joseph
  ) | sed "s/ /\\\,/g" )
 
#  arn:aws:imagebuilder:${AWS::Region}:aws:image/amazon-linux-2-${Architecture}/x.x.x