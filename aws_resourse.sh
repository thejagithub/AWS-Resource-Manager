#!/bin/bash

#####################################################################
#This is a scipt to list the resources in an AWS account

#Author: Thejana Ravindu

#Version: v0.0.1
#
#
# Following are the AWS resoures that can be listed using this script
# 1. EC2
# 2. S3
# 3. IAM
# 4. Lambda
# 5. RDS
# 6. DynamoDB
# 7. CloudFormation
# 8. CloudWatch
# 9. Route53
# 10. VPC
# 11. ELB
# 12. SNS
# 13. SQS
# 14. CloudTrail
# 15. CloudFront

#Usage: ./aws_resource.sh <region> <service_name>
#Example: ./aws_resource.sh us-east-1 ec2
#Example: ./aws_resource.sh us-east-1 s3
#Example: ./aws_resource.sh us-east-1 iam

#######################################################################


# Check if the user has provided the required arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 <region> <service_name>"
    echo "Example: $0 us-east-1 ec2"
    exit 1
fi

# Check if the AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI could not be found. Please install it and try again."
    exit 1
fi

# Check if the AWS CLI is configured
if [! -d ~/.aws ]; then
    echo "AWS CLI is not configured. Please configure it using 'aws configure' and try again."
    exit 1
fi

# Execute the AWS CLI command to list the resources based on the service name
case $2 in
    ec2)
        aws ec2 describe-instances --region $1 
        ;;
    s3)
        aws s3api list-buckets --region $1 
        ;;
    iam)
        aws iam list-users --region $1 
        ;;
    lambda)
        aws lambda list-functions --region $1 
        ;;
    rds)
        aws rds describe-db-instances --region $1 
        ;;
    dynamodb)
        aws dynamodb list-tables --region $1 
        ;;
    cloudformation)
        aws cloudformation list-stacks --region $1 
        ;;
    cloudwatch)
        aws cloudwatch list-metrics --region $1 
        ;;
    route53)
        aws route53 list-hosted-zones --region $1 
        ;;
    vpc)
        aws ec2 describe-vpcs --region $1 
        ;;
    elb)
        aws elbv2 describe-load-balancers --region $1 
        ;;
    sns)
        aws sns list-topics --region $1 
        ;;
    sqs)
        aws sqs list-queues --region $1 
        ;;
    cloudtrail)
        aws cloudtrail describe-trails --region $1 
        ;;
    cloudfront)
        aws cloudfront list-distributions --region $1 
        ;;
    *)
        echo "Invalid service name. Please provide a valid service name."
        echo "Available services: ec2, s3, iam, lambda, rds, dynamodb, cloudformation, cloudwatch, route53, vpc, elb, sns, sqs, cloudtrail, cloudfront"
        exit 1
        ;;
esac