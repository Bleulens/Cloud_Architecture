# Terraform AWS Infrastructure Project

## Overview

This project serves as the **foundation for all future aws cloud projects**, built using Terraform. It focuses on **modular design**, ensuring reusability and scalability across different AWS environments. By defining commonly used modules—such as **networking, EC2 instances, S3 storage, CloudWatch monitoring, security groups, IAM roles, and more**—this setup streamlines cloud provisioning while maintaining flexibility.

Using **Terraform Cloud** for state management, this project eliminates the need for manual backend configurations, enabling secure and efficient infrastructure deployment with built-in state locking and version control.

"This project also incorporates automation tools such as GitHub Actions, VS Code tasks, and a Makefile to streamline workflows."

### Key Components

- **Terraform Cloud for State Management:**  
  This project uses **Terraform Cloud** to store and manage Terraform state remotely. Terraform Cloud provides built-in state locking and version control, eliminating the need for an S3 bucket and DynamoDB table.

- **IAM Roles & Policies for Secure Authentication:**  
  AWS Identity and Access Management (IAM) roles and policies grant Terraform the necessary permissions to manage resources while following the principle of least privilege. Terraform Cloud interacts with AWS using these IAM roles rather than direct credentials, improving security and access control.

## Git Ignore Guidelines

This project uses a `.gitignore` file to exclude unnecessary or sensitive files from version control. Key exclusions include:

- **Terraform-related files:**
  - `.terraform/` (local Terraform cache)
  - `terraform.tfstate` and `terraform.tfstate.backup` (state files)
  - `tfplan` (Terraform plan output)

- **Automation and logs:**
  - `logs/` (temporary logs)
  - `.vscode/` (VS Code workspace settings)
  - `.DS_Store` (macOS system files)
  - `*.log` (log files)

- **Secrets and Credentials:**  
  - Never store sensitive environment files or credentials in version control.

Ensuring a well-structured `.gitignore` helps maintain a clean repo and prevents accidental exposure of sensitive infrastructure data.

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
- **State File Security:**  
  The Terraform state file contains sensitive information about your infrastructure. By leveraging **Terraform Cloud**, state management is handled securely with built-in encryption and access control. Terraform Cloud ensures state locking to prevent concurrent modifications and provides versioning for better collaboration. Access to the state file is restricted based on workspace permissions, eliminating the need for manual S3 bucket configurations.
- **Principle of Least Privilege:** Ensure that the IAM roles and policies used by Terraform grant only the necessary permissions to manage the intended resources. Regularly review and refine these policies.

## Automation & Workflow Enhancements

To improve efficiency and maintain consistency across infrastructure deployments, this project integrates several automation tools:

- **GitHub Actions for CI/CD:**  
  Automates Terraform validation, linting, and deployment workflows, ensuring code quality and reducing manual intervention.

- **VS Code Tasks for Streamlined Execution:**  
  Defines custom tasks within **Visual Studio Code**, allowing quick execution of Terraform commands (e.g., `init`, `plan`, `apply`) without manually typing them in the terminal.

- **Makefile for Simplified Command Execution:**  
  Provides a structured way to manage Terraform commands, reducing repetitive typing and enforcing standardized workflows.

- **Cleanup Bash Script for Resource Removal:**  
  A custom shell script automates the cleanup process, ensuring that temporary files and unused resources are properly removed to maintain a clean working environment.

These tools enhance developer experience, improve automation, and ensure repeatability for future cloud projects.

## License

This project is licensed under the [MIT License](LICENSE).

## Authors

- Marvin Stewart
