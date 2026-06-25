# High Availability Cloud System

Multi-AZ AWS infrastructure simulating production reliability environment. Demonstrates automatic failover, load balancing, and auto-scaling using Terraform Infrastructure as Code.

## Architecture

```
Internet
    │
    ▼
Application Load Balancer (ALB)
    │
    ├── eu-central-1a
    │       └── EC2 t3.micro (Auto Scaling)
    │
    └── eu-central-1b
            └── EC2 t3.micro (Auto Scaling)

Auto Scaling Group: min=1, desired=2, max=4
```

## Features
- Multi-AZ deployment (2 Availability Zones)
- Application Load Balancer with health checks
- Auto Scaling Group (scales up/down based on load)
- Custom VPC with public subnets
- Security Groups (ALB → EC2 traffic only)
- Terraform remote state in S3

## Tech Stack
- **Terraform** - Infrastructure as Code
- **AWS ALB** - Application Load Balancer
- **AWS EC2** - Compute instances (t3.micro)
- **AWS Auto Scaling** - Automatic scaling
- **AWS VPC** - Custom network
- **Docker** - Application containerization
- **S3** - Terraform remote state

## Infrastructure Resources (Terraform)

| Resource | Description |
|----------|-------------|
| VPC | Custom 10.0.0.0/16 network |
| Internet Gateway | Public internet access |
| 2 Subnets | One per Availability Zone |
| ALB | Load balancer (port 80) |
| Target Group | Health check on /health |
| Launch Template | EC2 config with Docker |
| Auto Scaling Group | min=1, desired=2, max=4 |
| 2 Security Groups | ALB and EC2 |

## Quick Start

```bash
git clone https://github.com/IvanLuketic2002/ha-system.git
cd ha-system/terraform

# Set AWS credentials
export AWS_ACCESS_KEY_ID="your-key"
export AWS_SECRET_ACCESS_KEY="your-secret"

terraform init
terraform plan
terraform apply -auto-approve

# Get ALB URL
terraform output alb_url

# Destroy after demo (avoid costs!)
terraform destroy -auto-approve
```

## Cost
~$0.02/hour while running (ALB + 2x EC2 t3.micro). Always run `terraform destroy` after demo.
