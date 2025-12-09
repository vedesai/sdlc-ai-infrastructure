# Infrastructure Provisioning Standards

This document is the reference for the SDLC-AI infrastructure setup.

For the full standards document, see the main repository: `_specs/infrastructure_provisioning_standards.md`

## Quick Reference

### AWS Services Used
- **Networking**: VPC, Subnets, NAT Gateway, Security Groups
- **Compute**: ECS Fargate
- **Database**: RDS PostgreSQL
- **Storage**: S3
- **CDN**: CloudFront
- **Container Registry**: ECR
- **Secrets**: Secrets Manager
- **Monitoring**: CloudWatch

### Environments
- `dev` - Development
- `staging` - Staging/QA
- `prod` - Production

### Naming Convention
`{project-name}-{environment}-{resource-type}`

Example: `sdlc-ai-dev-vpc`
