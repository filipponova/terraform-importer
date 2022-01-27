#!/usr/bin/env bash


terraform-init(){
   DIR=".terraform"

   if [ -d "$DIR" ]; 
   then
        echo "Starting..."
        echo "Script started! Insert Data."
   else
       echo "Creating the terraform init file..."
       touch main.tf
       echo "File Created! Iserting default config in file..."
       echo "resource \"aws_cloudfront_distribution\" \"distribution\" {}" | tee -a main.tf
       echo "Starting terraform init..."
       terraform init
   fi

}

importer(){ 
    read -r -p "Enter with the aws resource(s)(eg. rds,ebs,ec2_instance): " AWS_RESOURCE
    read -r -p "Enter with the Resource name or id: " RESOURCE_NAME
    read -r -p "Enter with the aws profile name: " PROFILE
    terraformer import aws --resources="${AWS_RESOURCE}" --filter="Name=id;Value=${RESOURCE_NAME}" --regions=us-east-1 --profile="${PROFILE}"
}

terraform-init
importer
