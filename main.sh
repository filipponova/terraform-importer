#!/usr/bin/env bash

terraform-init() {
    DIR=".terraform"

    if [ -d "$DIR" ]; then
        echo "Starting..."
        echo "Script started! Insert Data."
    else
        echo "Creating the terraform init file..."
        touch main.tf
        echo "File Created! Iserting default config in file..."
        echo "resource \"aws_cloudfront_distribution\" \"distribution\" {}" | tee -a main.tf
        echo "Starting terraform init..."
        bin/terraform init
    fi

}

importer() {
    read -r -p "Enter with the aws resource(s)(eg. rds,ebs,ec2_instance): " AWS_RESOURCE
    read -r -p "Enter with the Resource name: " RESOURCE_NAME
    read -r -p "Enter with the aws profile name: " PROFILE
    bin/terraformer import aws --resources="${AWS_RESOURCE}" --connect=true  --filter="Name=tags.Name;Value=${RESOURCE_NAME}" --profile "${PROFILE}"
}

replace-provider() {
    IMPORTER_DIR="generated/aws/${AWS_RESOURCE}"

    if [ -d "$IMPORTER_DIR" ]; then
        cd "${IMPORTER_DIR}" || return
        echo "Updating provider..."
        terraform state replace-provider -auto-approve "registry.terraform.io/-/aws" "hashicorp/aws"
    else
        echo "Importer Directory Not Found!"
    fi
}

terraform-init
importer
replace-provider
