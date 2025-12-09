#!/bin/bash
# AI Generated Code by Deloitte + Cursor (BEGIN)
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CFN_DIR="${SCRIPT_DIR}/../cloudformation"
REGION="${AWS_REGION:-us-east-1}"

echo "Validating CloudFormation templates..."

for template in "${CFN_DIR}"/*.yaml; do
  echo "Validating $(basename "$template")..."
  aws cloudformation validate-template --template-body "file://${template}" --region "${REGION}" > /dev/null
  echo "  ✓ Valid"
done

echo "All templates are valid!"
# AI Generated Code by Deloitte + Cursor (END)
