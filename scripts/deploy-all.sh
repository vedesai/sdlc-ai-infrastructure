#!/bin/bash
# AI Generated Code by Deloitte + Cursor (BEGIN)
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CFN_DIR="${SCRIPT_DIR}/../cloudformation"

PROJECT_NAME="${PROJECT_NAME:-sdlc-ai}"
ENVIRONMENT="${ENVIRONMENT:-dev}"
REGION="${AWS_REGION:-us-east-1}"

echo "Deploying ${PROJECT_NAME} infrastructure to ${ENVIRONMENT}..."

# Deploy Network Stack
echo "Deploying network stack..."
aws cloudformation deploy \
  --template-file "${CFN_DIR}/network-stack.yaml" \
  --stack-name "${PROJECT_NAME}-${ENVIRONMENT}-network" \
  --parameter-overrides Environment=${ENVIRONMENT} ProjectName=${PROJECT_NAME} \
  --capabilities CAPABILITY_NAMED_IAM \
  --region "${REGION}"

# Deploy Database Stack
echo "Deploying database stack..."
aws cloudformation deploy \
  --template-file "${CFN_DIR}/database-stack.yaml" \
  --stack-name "${PROJECT_NAME}-${ENVIRONMENT}-database" \
  --parameter-overrides Environment=${ENVIRONMENT} ProjectName=${PROJECT_NAME} \
  --capabilities CAPABILITY_NAMED_IAM \
  --region "${REGION}"

# Deploy Frontend Stack
echo "Deploying frontend stack..."
aws cloudformation deploy \
  --template-file "${CFN_DIR}/frontend-stack.yaml" \
  --stack-name "${PROJECT_NAME}-${ENVIRONMENT}-frontend" \
  --parameter-overrides Environment=${ENVIRONMENT} ProjectName=${PROJECT_NAME} \
  --capabilities CAPABILITY_NAMED_IAM \
  --region "${REGION}"

# Deploy Backend Stack
echo "Deploying backend stack..."
aws cloudformation deploy \
  --template-file "${CFN_DIR}/backend-stack.yaml" \
  --stack-name "${PROJECT_NAME}-${ENVIRONMENT}-backend" \
  --parameter-overrides Environment=${ENVIRONMENT} ProjectName=${PROJECT_NAME} \
  --capabilities CAPABILITY_NAMED_IAM \
  --region "${REGION}"

# Deploy Monitoring Stack
echo "Deploying monitoring stack..."
aws cloudformation deploy \
  --template-file "${CFN_DIR}/monitoring-stack.yaml" \
  --stack-name "${PROJECT_NAME}-${ENVIRONMENT}-monitoring" \
  --parameter-overrides Environment=${ENVIRONMENT} ProjectName=${PROJECT_NAME} \
  --capabilities CAPABILITY_NAMED_IAM \
  --region "${REGION}"

echo "Deployment complete!"
# AI Generated Code by Deloitte + Cursor (END)
