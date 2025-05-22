# 🚀 Week 3:

---

## Task1
```plaintext
week3_task1/
├── infrastructure/
│   ├── common/
│   │   ├── cloudwatch.tf
│   │   ├── documentdb.tf
│   │   ├── ec2.tf
│   │   ├── iam.tf
│   │   ├── load_balancer.tf
│   │   ├── main.tf
│   │   ├── network.tf
│   │   ├── outputs.tf
│   │   ├── sns.tf
│   │   └── variables.tf
│   ├── dev/
│   │   ├── cloudwatch.tf
│   │   ├── ec2.tf
│   │   ├── load_balancer.tf
│   │   ├── network.tf
│   │   ├── outputs.tf
│   │   ├── sns.tf
│   │   └── variables.tf
│   ├── env/
│   │   ├── cloudwatch.tf
│   │   ├── ec2.tf
│   │   ├── load_balancer.tf
│   │   ├── network.tf
│   │   ├── outputs.tf
│   │   ├── sns.tf
│   │   └── variables.tf
│   └── production/
│       ├── cloudwatch.tf
│       ├── ec2.tf
│       ├── load_balancer.tf
│       ├── network.tf
│       ├── outputs.tf
│       ├── sns.tf
│       └── variables.tf
└── user_data/
    └── user_data.sh
```

## Task2

```plaintext
terraform-modules/
└── demo-app/
    ├── alb/
    │   ├── load_balancer.tf
    │   ├── outputs.tf
    │   └── variables.tf
    ├── autoscaling/
    │   ├── ec2.tf
    │   └── variables.tf
    └── vpc/
        ├── network.tf
        ├── outputs.tf
        └── variables.tf

terragrunt/
├── dev/
│   ├── app/
│   │   ├── alb/
│   │   │   └── terragrunt.hcl
│   │   └── autoscaling/
│   │       └── terragrunt.hcl
│   └── vpc/
│       └── terragrunt.hcl
├── load-testing/
│   ├── app/
│   │   ├── alb/
│   │   │   └── terragrunt.hcl
│   │   └── autoscaling/
│   │       └── terragrunt.hcl
│   └── vpc/
│       └── terragrunt.hcl
├── production/
│   ├── app/
│   │   ├── alb/
│   │   │   └── terragrunt.hcl
│   │   └── autoscaling/
│   │       └── terragrunt.hcl
│   └── vpc/
│       └── terragrunt.hcl
├── terragrunt.hcl
└── user_data/
    └── user_data.sh
```

## Task3
```plaintext
iam.tf
documentdb.tf
```
