# Terraform AWS Infrastructure Project

## Overview

This project provisions and manages AWS infrastructure using Terraform, emphasizing **IAM roles and policies** for secure authentication. It establishes a foundational setup for managing your AWS resources in a scalable and secure manner.

### Key Components:

- **S3 Bucket for Terraform State Storage:** A dedicated S3 bucket to securely store your Terraform state files, enabling collaboration and version control of your infrastructure.
- **DynamoDB Table for State Locking:** Implements state locking using a DynamoDB table to prevent concurrent modifications to your Terraform state, ensuring consistency.
- **IAM Roles & Policies for Secure Authentication:** Leverages AWS Identity and Access Management (IAM) roles and policies to grant Terraform the necessary permissions to manage resources without exposing sensitive AWS credentials directly. This follows the principle of least privilege.

## Prerequisites

Before you begin, ensure you have the following installed and configured:

- **Terraform:** Download and install Terraform from the official [Terraform website](https://developer.hashicorp.com/terraform/downloads). Ensure it's added to your system's PATH. You can verify the installation by running `terraform version` in your terminal.
- **AWS CLI:** Install and configure the AWS Command Line Interface (CLI) as described in the [AWS documentation](https://docs.awsamazon.com/cli/latest/userguide/install-cliv2.html).
- **IAM Role Configuration:** The AWS CLI must be configured to use an IAM role with the necessary permissions to interact with the AWS services defined in this Terraform project (S3, DynamoDB, IAM, and any other resources you plan to manage). This role should have properly assigned **IAM policies** that adhere to the principle of least privilege, granting only the permissions required for Terraform to function.

## Setup

Follow these steps to set up and initialize your Terraform project:

1.  **Clone the Repository:**

    ```sh
    git clone https://github.com/Bleulens/Cloud_Architecture.git
    cd Cloud_Architecture
    ```

2.  **Initialize Terraform:**
    Navigate to the project directory in your terminal and run the following command to initialize Terraform. This will download the necessary provider plugins (in this case, the AWS provider).
    ```sh
    terraform init
    ```

## Configuration

Before applying the Terraform configuration, you might need to customize certain variables. These are typically defined in `.tfvars` files or environment variables.

1.  **Review `variables.tf`:** This file defines the input variables for your Terraform configuration. Take a look at the descriptions and default values.

2.  **Create `terraform.tfvars` (Optional but Recommended):** Create a file named `terraform.tfvars` in your project directory to override the default variable values. For example:

    ```terraform
    aws_region = "us-east-1"
    s3_bucket_name = "your-unique-state-bucket-name"
    dynamodb_table_name = "your-unique-state-lock-table-name"
    ```

    **Important:** Ensure your S3 bucket and DynamoDB table names are globally unique.

## Usage

Once you have initialized and configured your project, you can use the following Terraform commands:

- **Plan:** To preview the changes that Terraform will make to your infrastructure:

  ```sh
  terraform plan
  ```

- **Apply:** To apply the changes and provision the AWS resources:

  ```sh
  terraform apply
  ```

  You will be prompted to confirm the actions before they are executed.

- **Destroy:** To tear down the infrastructure managed by Terraform:
  ```sh
  terraform destroy
  ```
  Use this command with caution, as it will permanently delete your AWS resources. You will be prompted to confirm the actions.

## Security Considerations

- **IAM Roles and Policies:** This project emphasizes the use of IAM roles and policies to ensure secure authentication and authorization. Avoid hardcoding AWS credentials directly in your Terraform configurations.
- **State File Security:** The Terraform state file contains sensitive information about your infrastructure. By storing it in a private S3 bucket with appropriate access controls and enabling server-side encryption (SSE-S3 or KMS), you can enhance its security.
- **Principle of Least Privilege:** Ensure that the IAM roles and policies used by Terraform grant only the necessary permissions to manage the intended resources. Regularly review and refine these policies.

## License

This project is licensed under the [MIT License](LICENSE).

## Authors

- Marvin Stewart
