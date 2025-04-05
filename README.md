# AWS-Resource-Manager

![Bash](https://img.shields.io/badge/Shell-Bash-lightgrey?logo=gnubash)
![AWS](https://img.shields.io/badge/AWS-CLI-orange?logo=amazonaws)
![License](https://img.shields.io/badge/license-MIT-blue)
![Status](https://img.shields.io/badge/status-Active-brightgreen)

Bash script to list AWS resources using AWS CLI for quick audits and region-based inventory checks.



# 🛠️ AWS Resource Listing Script

A simple Bash script to list various AWS resources in a given region using AWS CLI.  
Perfect for quick audits, monitoring, or learning how AWS CLI works.

---

## 📜 Features

- Lists AWS services like EC2, S3, IAM, Lambda, and more.
- Accepts region and service name as input.
- Lightweight, fast, and customizable.

---

## 🚀 Usage

### ✅ Prerequisites
- AWS CLI installed and configured (`aws configure`)
- Bash shell
- Execution permission (`chmod +x aws_resource.sh`)

### 📦 Supported AWS Services
- EC2
- S3
- IAM
- Lambda
- RDS
- DynamoDB
- CloudFormation
- CloudWatch
- Route53
- VPC
- ELB
- SNS
- SQS
- CloudTrail
- CloudFront

### 📌 Syntax
```bash
./aws_resource.sh <region> <service_name>

🧪 Examples
./aws_resource.sh ap-south-1 ec2
./aws_resource.sh us-east-1 s3

## 📸 Example Output

![Example Output](example-output.png)



