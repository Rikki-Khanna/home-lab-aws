# home-lab-aws

# Docker

To build docker image:
```
docker build -t <image_name> .
```

To create and start container from docker image:
```
docker run -it -d <image_name>
```

To list all running containers:
```
docker ps
```

# Terraform

This repo have terraform module for creating VPC, Subnet under VPC, EC2 instance under VPC and EBS volume attachment with EC2 instance.

Also, repo contain some basic go test case to verify resource is created successfully from module.

To run go test locally, Please follow below steps..

prerequisite - go software needs to be installed for version > 1.18

Go to specific module test directory and below go test commands :-

go mod init test

go mod tidy

go test

# CI CD

This repo have workflow to run linting, validate and deploy terraform code in AWS with every push in main branch.