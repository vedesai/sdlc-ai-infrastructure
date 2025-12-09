# SDLC-AI Infrastructure

Infrastructure as Code (IaC) repository for the SDLC-AI application, using AWS CloudFormation.

## 📁 Repository Structure

```
infrastructure/
├── cloudformation/           # CloudFormation templates
│   ├── network-stack.yaml    # VPC, Subnets, Security Groups
│   ├── database-stack.yaml   # RDS PostgreSQL, Secrets Manager
│   ├── frontend-stack.yaml   # S3, CloudFront CDN
│   ├── backend-stack.yaml    # ECR, ECS Fargate, ALB
│   ├── monitoring-stack.yaml # CloudWatch, Alarms, SNS
│   └── README.md             # Template documentation
├── scripts/                  # Deployment scripts
│   ├── deploy-all.sh         # Deploy all stacks
│   ├── deploy-frontend.sh    # Frontend deployment
│   ├── push-docker-image.sh  # Docker image build/push
│   ├── teardown.sh           # Infrastructure teardown
│   └── validate-templates.sh # Template validation
├── docker/                   # Docker configurations
│   └── Dockerfile            # Backend container image
├── .github/workflows/        # CI/CD pipelines
│   ├── frontend-deploy.yml   # Frontend CI/CD
│   └── backend-deploy.yml    # Backend CI/CD
└── docs/                     # Documentation
    └── infrastructure_provisioning_standards.md
```

## 🚀 Quick Start

### Prerequisites

- AWS CLI v2.x configured with appropriate credentials
- Bash shell (Linux/macOS/WSL)
- Docker (for building images)

### Deploy Infrastructure

```bash
# Validate templates
./scripts/validate-templates.sh -l

# Deploy all stacks to dev environment
./scripts/deploy-all.sh -e dev

# Deploy to production
./scripts/deploy-all.sh -e prod -P your-aws-profile
```

## 📋 Stack Deployment Order

| Order | Stack | Dependencies | Est. Time |
|-------|-------|--------------|-----------|
| 1 | network | None | ~5 min |
| 2 | database | network | ~15 min |
| 3 | frontend | None | ~5 min |
| 4 | backend | network, database | ~10 min |
| 5 | monitoring | All stacks | ~2 min |

## 🔒 Security Features

- ✅ VPC with public/private subnet isolation
- ✅ KMS encryption for RDS and S3
- ✅ Secrets Manager for credentials
- ✅ IAM roles with least privilege
- ✅ Security groups with strict rules

## 📄 License

Proprietary - Deloitte
