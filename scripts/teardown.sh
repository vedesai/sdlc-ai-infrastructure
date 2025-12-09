#!/bin/bash
# AI Generated Code by Deloitte + Cursor (BEGIN)
set -e

PROJECT_NAME="${PROJECT_NAME:-sdlc-ai}"
ENVIRONMENT="${ENVIRONMENT:-dev}"
REGION="${AWS_REGION:-us-east-1}"

echo "Tearing down ${PROJECT_NAME} infrastructure from ${ENVIRONMENT}..."
echo "WARNING: This will delete all resources!"
read -p "Type 'yes' to confirm: " confirm

if [ "$confirm" != "yes" ]; then
  echo "Cancelled."
  exit 0
fi

# Delete in reverse order
aws cloudformation delete-stack --stack-name "${PROJECT_NAME}-${ENVIRONMENT}-monitoring" --region "${REGION}"
aws cloudformation wait stack-delete-complete --stack-name "${PROJECT_NAME}-${ENVIRONMENT}-monitoring" --region "${REGION}" || true

aws cloudformation delete-stack --stack-name "${PROJECT_NAME}-${ENVIRONMENT}-backend" --region "${REGION}"
aws cloudformation wait stack-delete-complete --stack-name "${PROJECT_NAME}-${ENVIRONMENT}-backend" --region "${REGION}" || true

aws cloudformation delete-stack --stack-name "${PROJECT_NAME}-${ENVIRONMENT}-frontend" --region "${REGION}"
aws cloudformation wait stack-delete-complete --stack-name "${PROJECT_NAME}-${ENVIRONMENT}-frontend" --region "${REGION}" || true

aws cloudformation delete-stack --stack-name "${PROJECT_NAME}-${ENVIRONMENT}-database" --region "${REGION}"
aws cloudformation wait stack-delete-complete --stack-name "${PROJECT_NAME}-${ENVIRONMENT}-database" --region "${REGION}" || true

aws cloudformation delete-stack --stack-name "${PROJECT_NAME}-${ENVIRONMENT}-network" --region "${REGION}"
aws cloudformation wait stack-delete-complete --stack-name "${PROJECT_NAME}-${ENVIRONMENT}-network" --region "${REGION}" || true

echo "Teardown complete!"
# AI Generated Code by Deloitte + Cursor (END)
