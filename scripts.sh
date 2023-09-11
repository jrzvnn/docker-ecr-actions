#!/bin/bash

# Define the list of images to pull and push
IMAGES=(
    # securecodebox/engine
    # securecodebox/nmap
    # securecodebox/zap
    # securecodebox/nikto
    # securecodebox/sslyze
    # securecodebox/bodgeit
    # securecodebox/amass
    # securecodebox/arachni
    # securecodebox/ssh
    # securecodebox/lurcher
    # securecodebox/hook-teams-notification
    securecodebox/scanner-gitleaks
    securecodebox/parser-ssh-scan
    securecodebox/hook-cascading-scans
    securecodebox/scanner-nmap
    securecodebox/scanner-test-scan
    securecodebox/scanner-kube-hunter
    securecodebox/hook-notification
    securecodebox/hook-generic-webhook
)

AWS_REGION="us-east-1"
ECR_URI="353472581086.dkr.ecr.us-east-1.amazonaws.com/dk-securecodebox"

aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
aws configure set default.region $AWS_REGION

$(aws ecr get-login --no-include-email --region $AWS_REGION)

for IMAGE in "${IMAGES[@]}"; do
    docker pull $IMAGE:latest
    NEW_TAG="$ECR_URI:$(basename $IMAGE)-latest"
    docker tag $IMAGE:latest $NEW_TAG
    docker push $NEW_TAG
done

 
