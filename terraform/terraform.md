# Infrastructure as code

### Topics
- Infrastructure as Code (IaC)
- terraform

## Infrastructure as Code (IaC)

### Problem scope
#### Setup IT infrastructure includes

- installation of application
- setup databases
- configuration of applications
- updates
- networking
- user and authentication

#### 
Managing this manually is time consuming, tedious, and error prone

### How it works
- managing infrastructure using code
- defining the desired state
- using an executable to align the desired with the actual state

### Advantages of IaC
- Consistency and Reproducibility
- Version Control
- Speed and Efficiency
- Scalability
- Documentation
- Disaster Recovery and Testing

### Drawbacks of IaC
- Learning curve
- Complexity
- Tools and abstraction
- Initial Investment
- Debugging and Complexity

## Terraform

### What is terraform?
- tool for IaC
- declarative syntax
- maintains a state file
	- mapping between resource and configuration
	- keep metadata about dependencies
- consists of
	- terraform core
	- terraform providers

### Providers
- Plugins to the tf core
- Enables tf to interact with
	- various cloud providers
	- services
	- infrastructure components

### Providers examples
#### Cloudproviders
- aws, google, azure
- salesforce
- Kubernetes

#### Services
- azure ad
- dns
- http
- tls

#### Functions
- local
- archive
- time
- random

### What is a tf Project?
- tf files in a directory
- tf files contain `hcl` language (hashicorp configuration language)
- consists
	- resource definitions
	- input parameters
	- output values

### Example

```json
provider "local" {
}

terraform {
  required_providers {
    local = {
      version = "~> 1.4"
    }
  }
}

resource "local_file" "hello" {
  content  = "Hello, Terraform"
  filename = "hello.txt"
}
```

### Example explanation
#### `terraform` block
- terraform settings
- required cloud providers where resources should be created

#### `providers` block
- configures the required providers

#### `resource` block
- defines components of the infrastructure
	- virtual machines (ec2)
	- application (docker instance)
- block contains the arguments to configure the resource

### Commands
#### `terraform init`
- initializes the folder with the terraform files
	- creates a folder with the provider executable
	- lock file

#### `terraform plan`
- compares the desired state with the actual state
- proposes changes to get to the desired state
- creates a plan how to apply the changes

#### `terraform apply`
- executes the changes proposed in a plan 

#### `terraform destroy`
- deletes all resources defined in the tf files

### Local variables
- provide reusable values, accessible in a project

```
locals {
  file_name = "file.txt"
}
resource "local_file" "file" {
  content = "Hello"
  file_name = local.file_name
}
data "archive_file" "file" {
  type = "zip"
  source_file = local.file_name
  output_path = "file.zip"
}
```

### Input variables
- provides values which can be changed from outside
- can be set by 
  - default values
  - cli parameters
  - in a file
  - env vars

### Input variables definition
#### Definition
```
variable "file_name" {
  description = "The name of the file"
  type = string # number, bool
  default = "file.txt"
}
```

#### Usage
```
resource "local_file" "file" {
  content = "Hello"
  file_name = var.file_name
}
```

### Set Input variables 
#### cli
`tf apply -var="file_name=hello.txt"`

#### `.tfvar` file
`file_name = hello.txt`

`tf apply -var-file="vars.tfvar"`

#### env var
`export TF_VAR_file_name=hello.txt`

### Output variable
- returns values from the created resources
- can be used by other projects

### Output variables definition

```
output "server_ip" {
  value = aws_instance.server.private_ip
}
```
