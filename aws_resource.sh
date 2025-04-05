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
        echo "Listing EC2 instances in region $1..."
        aws ec2 describe-instances --region $1 
        ;;
    s3)
        echo "Listing S3 buckets in region $1..."
        aws s3api list-buckets --region $1 
        ;;
    iam)
        echo "Listing IAM users in region $1..."
        aws iam list-users --region $1 
        ;;
    lambda)
        echo "Listing Lambda functions in region $1..."
        aws lambda list-functions --region $1 
        ;;
    rds)
        echo "Listing RDS instances in region $1..."
        aws rds describe-db-instances --region $1 
        ;;
    dynamodb)
        echo "Listing DynamoDB tables in region $1..."
        aws dynamodb list-tables --region $1 
        ;;
    cloudformation)
        echo "Listing CloudFormation stacks in region $1..."
        aws cloudformation list-stacks --region $1 
        ;;
    cloudwatch)
        echo "Listing CloudWatch metrics in region $1..."
        aws cloudwatch list-metrics --region $1 
        ;;
    route53)
        echo "Listing Route53 hosted zones in region $1..."
        aws route53 list-hosted-zones --region $1 
        ;;
    vpc)
        echo "Listing VPCs in region $1..."
        aws ec2 describe-vpcs --region $1 
        ;;
    elb)
        echo "Listing ELB load balancers in region $1..."
        aws elbv2 describe-load-balancers --region $1 
        ;;
    sns)
        echo "Listing SNS topics in region $1..."
        aws sns list-topics --region $1 
        ;;
    sqs)
        echo "Listing SQS queues in region $1..."
        aws sqs list-queues --region $1 
        ;;
    cloudtrail)
        echo "Listing CloudTrail trails in region $1..."
        aws cloudtrail describe-trails --region $1 
        ;;
    cloudfront)
        echo "Listing CloudFront distributions in region $1..."
        aws cloudfront list-distributions --region $1 
        ;;
    *)
        echo "Invalid service name. Please provide a valid service name."
        echo "Available services: ec2, s3, iam, lambda, rds, dynamodb, cloudformation, cloudwatch, route53, vpc, elb, sns, sqs, cloudtrail, cloudfront"
        exit 1
        ;;
esac