# Terraform for AWS EKS Monitoring with Fluent Bit and AWS Cloudwatch Metrics
This Terraform project automates the setup of monitoring AWS Elastic Kubernetes Service (EKS) cluster. It uses Fluent Bit for log collection and AWS Cloudwatch Metrics for metrics collection, and sends both data to AWS CloudWatch for centralized observability.

## Features
- **AWS CloudWatch**: EKS logs and metrics are pushed to AWS CloudWatch for real-time monitoring and detailed analyzing.
- **Automatic IAM Roles and Permissions**: Necessary IAM roles and permissions are automatically created and assigned to avoid potential problems with authorization.
- **DaemonSet Deployment**: Fluent Bit and Cloudwatch Metrics are deployed as DaemonSets with proper toleration, ensuring the instances run on every node in the cluster for comprehensive data collection.
-   **Customization**: The Terraform configuration has been designed to allow easy tweaks and changes to fit various use-cases and requirements.

## Prerequisites
-   An AWS account.
-   Terraform installed.
-   AWS CLI configured with necessary credentials.
-   An existing EKS cluster.

## Usage
1. **Clone the repository**:
```bash
git clone https://github.com/dasmeta/terraform-aws-eks.git
cd terraform-aws-eks
```
2.  **Edit** `terraform.tfvars` **to provide necessary information and personalize your development. See sections below for additional information.**

4. **Initialize Terraform**:
```bash
terraform init
```
5. **Plan the deployment**:
```bash
terraform plan
```
6. **Apply and approve the plan**:
```bash
terraform apply
```
## Customization

The provided Terraform scripts are structured to promote customization and ease of use:

1.  **Variable-Based Configuration**: Variables in `terraform.tfvars` can be modified to tune the behavior of the Fluent Bit and AWS CloudWatch setups. By providing different values during the `terraform apply` command or by modifying default values, you can tailor the deployment to your specific needs.
    
2.  **Fluent Bit Adjustments**: The Fluent Bit setup, including filters and output plugins, can be tailored to your requirements. Using the `fluent_bit_values_yaml` variable, you can provide a custom `values.yaml` file for Helm to use, overriding the default configurations.
    
3.  **CloudWatch Metrics Customization**: Metrics sent to AWS CloudWatch can be tuned by adjusting the `aws_cloudwatch_metrics_values_yaml` variable, providing a custom `values.yaml` for the AWS CloudWatch Metrics Helm deployment.
    
4.  **IAM Role Naming**: For organizations with strict naming conventions, the IAM roles created for Fluent Bit and AWS CloudWatch Metrics can be named accordingly using the `fluent_bit_use_iam_role_name_prefix`, `fluent_bit_iam_role_name`, `aws_cloudwatch_metrics_use_iam_role_name_prefix`, and `aws_cloudwatch_metrics_iam_role_name` variables.
    
5.  **Namespace Organization**: By default, Fluent Bit and AWS CloudWatch Metrics are deployed in their respective namespaces. These can be adjusted to fit into any existing namespace structure within your EKS cluster.

## Variables

### Required Variables

| Name                             | Description                                               | Type         |
|----------------------------------|-----------------------------------------------------------|--------------|
| `profile`                        | AWS profile.                                              | `string`    |
| `region`                         | AWS region.                                               | `string`    |
| `cluster_name`                   | Cluster name.                                             | `string`    |
| `enable_fluent_bit`              | Enable fluent Bit to collect logs.                        | `bool`      |
| `enable_aws_cloudwatch_metrics` | Enable AWS Cloudwatch Metrics to collect metrics.         | `bool`      |

### Optional Variables

| Name                                             | Description                                                                     | Type         | Default                       |
|--------------------------------------------------|---------------------------------------------------------------------------------|--------------|-------------------------------|
| `fluent_bit_release_name`                        | Release name.                                                                   | `string`    | `fluent-bit`                  |
| `fluent_bit_chart_version`                       | Chart version.                                                                  | `string`    | `0.37.0`                      |
| `fluent_bit_namespace`                           | Namespace.                                                                      | `string`    | `fluent-bit`                  |
| `fluent_bit_service_account_name`                | Service account name.                                                           | `string`    | `fluent-bit-sa`               |
| `fluent_bit_use_iam_role_name_prefix`            | Use the role name as a prefix followed by the cluster name.                    | `bool`      | `true`                        |
| `fluent_bit_iam_role_name`                       | Role name or role name prefix.                                                  | `string`    | `EKSFluentBitRole-`           |
| `fluent_bit_values_yaml`                         | values.yaml passed to helm. This overrides the default values.                  | `string`    | `null`                        |
| `fluent_bit_schedule_yaml`                       | schedule.yaml passed to helm. This overrides the default toleration setup.     | `string`    | `null`                        |
| `fluent_bit_read_from_head`                      | Read logs generated before fluent bit is deployed.                              | `bool`      | `false`                       |
| `fluent_bit_log_retention_days`                  | Log retention days.                                                             | `number`    | `7`                           |
| `aws_cloudwatch_metrics_release_name`            | Release name.                                                                   | `string`    | `aws-cloudwatch-metrics`      |
| `aws_cloudwatch_metrics_chart_version`           | Chart version.                                                                  | `string`    | `0.0.9`                       |
| `aws_cloudwatch_metrics_namespace`               | Namespace.                                                                      | `string`    | `aws-cloudwatch-metrics`      |
| `aws_cloudwatch_metrics_service_account_name`    | Service account name.                                                           | `string`    | `aws-cloudwatch-metrics-sa`   |
| `aws_cloudwatch_metrics_use_iam_role_name_prefix`| Use the role name as a prefix followed by the cluster name.                    | `bool`      | `true`                        |
| `aws_cloudwatch_metrics_iam_role_name`           | Role name or role name prefix.                                                  | `string`    | `EKSCloudwatchMetricsRole-`   |
| `aws_cloudwatch_metrics_values_yaml`             | values.yaml passed to helm. This overrides the default values.                  | `string`    | `null`                        |
| `aws_cloudwatch_metrics_schedule_yaml`           | schedule.yaml passed to helm. This overrides the default toleration setup.     | `string`    | `null`                        |
| `aws_cloudwatch_metrics_containerd_sock_path`    | AWS Cloudwatch Metrics containerd sock path.                                    | `string`    | `/run/dockershim.sock`        |

## References
1. **EKS User Guide**: Learn more about AWS's managed Kubernetes service.
   - [Amazon EKS User Guide](https://docs.aws.amazon.com/eks/latest/userguide/what-is-eks.html)

2. **Terraform AWS Provider**: Deep dive into Terraform's AWS provider to understand available resources and data sources.
   - [Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

3. **Fluent Bit**: Gain an in-depth understanding of Fluent Bit configurations and capabilities. 
   - [Official Website](https://fluentbit.io/)
   - [GitHub Repository](https://github.com/fluent/fluent-bit)
   - [Documentation](https://docs.fluentbit.io/)

4. **Helm Charts for Fluent Bit & AWS Cloudwatch Metrics**: Helm is used to manage Kubernetes applications. The charts provide deployable packages.
   - [Fluent Bit Helm Chart](https://artifacthub.io/packages/helm/bitnami/fluent-bit)
   - [AWS CloudWatch Metrics Helm Chart](https://artifacthub.io/packages/helm/aws/aws-cloudwatch-metrics)
