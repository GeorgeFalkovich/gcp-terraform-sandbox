# Cloud SQL Terraform Module

This module provides a Terraform configuration for creating a Google Cloud SQL database instance, along with a database, user, private IP address, and service networking connection.

## Usage

To use this module, include it in your Terraform configuration as follows:

```hcl
module "cloudsql" {
  source   = "./cloudsql-module"
  region   = "us-central1"  # Specify your desired region
  vpc_name = "your-vpc-name" # Specify your VPC name
}
```

## Input Variables

| Name       | Description                                   | Type   | Default       |
|------------|-----------------------------------------------|--------|---------------|
| region     | The region where the Cloud SQL instance will be created. | string | n/a           |
| vpc_name   | The name of the VPC to use for private IP configuration. | string | n/a           |

## Outputs

| Name                     | Description                                      |
|--------------------------|--------------------------------------------------|
| instance_connection_name  | The connection name for the Cloud SQL instance. |

## Requirements

- Terraform 0.12 or later
- Google Cloud provider

## Author

This module is maintained by [Your Name or Organization].

## License

This module is licensed under the MIT License.