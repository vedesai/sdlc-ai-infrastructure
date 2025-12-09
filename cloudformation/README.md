# SDLC-AI CloudFormation Templates

## Stack Overview

| Stack | File | Description |
|-------|------|-------------|
| Network | `network-stack.yaml` | VPC, Subnets, NAT Gateway, Security Groups |
| Database | `database-stack.yaml` | RDS PostgreSQL, Secrets Manager |
| Frontend | `frontend-stack.yaml` | S3 bucket, CloudFront distribution |
| Backend | `backend-stack.yaml` | ECR, ECS Cluster, ALB, Auto-scaling |
| Monitoring | `monitoring-stack.yaml` | CloudWatch dashboards, Alarms |

## Deployment Order

1. **network-stack** (no dependencies)
2. **database-stack** (depends on network)
3. **frontend-stack** (no dependencies)
4. **backend-stack** (depends on network, database)
5. **monitoring-stack** (depends on backend)

## Quick Deploy

```bash
# Deploy all stacks
./scripts/deploy-all.sh

# Validate templates
./scripts/validate-templates.sh

# Teardown
./scripts/teardown.sh
```
