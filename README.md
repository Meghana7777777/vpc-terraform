# Terraform AWS VPC with NAT Gateway

This Terraform script provisions an AWS Virtual Private Cloud (VPC) with public and private subnets, an internet gateway, a NAT gateway, and route tables to enable access to the internet from the public subnets and resources in the private subnets.

## Prerequisites

Before running this Terraform script, you will need:

- An AWS account
- The AWS CLI installed and configured on your local machine
- Terraform installed on your local machine

## Usage

To use this Terraform script:

1. Clone this repository to your local machine.
2. Navigate to the cloned repository directory.
3. Create a `terraform.tfvars` file and set the desired variable values for your environment.

4. Initialize the Terraform working directory:
    ```terraform init```

5. Plan the infrastructure changes:
    ```terraform plan```

6. Apply the infrastructure changes:
    ```terraform apply```

## Outputs

This Terraform script will output the following resources:

- `vpc_id`: The ID of the VPC.
- `public_subnet_id`: The ID of the public subnet.
- `private_subnet_id`: The ID of the private subnet.
- `internet_gateway_id`: The ID of the internet gateway.
- `nat_gateway_id`: The ID of the NAT gateway.