# Terraform Beginner Bootcamp 2023 
  * [Semantic Versioning](#semantic-versioning)
  * [Install Terraform CLI](#install-terraform-cli)
    + [Workspace Lifecycle](#workspace-lifecycle)
    + [Considerations for Terraform Installation](#considerations-for-terraform-installation)
      - [Shebang](#shebang)
    + [Working with Env Vars](#working-with-env-vars)
    + [Scoping ENV vars](#scoping-env-vars)
    + [AWS CLI Installation](#aws-cli-installation)
  * [Terraform Basics](#terraform-basics)
    + [Terraform Registry](#terraform-registry)
    + [Terraform Console](#terraform-console)
      - [Terraform init](#terraform-init)
      - [Terraform plan](#terraform-plan)
      - [Terraform apply](#terraform-apply)
    + [Terraform Destroy](#terraform-destroy)
    + [Terraform Cloud](#terraform-cloud)
    + [create Alias for terraform in ~/.bash_profile](#create-alias-for-terraform-in---bash-profile)
   
  #### [Tool for generating TOC](https://ecotrust-canada.github.io/markdown-toc/)
## Semantic Versioning

The general format is ***MAJOR.MINOR.PATCH***, e.g `1.2.0`

- MAJOR version when you make incompatible API changes
- MINOR version when you add functionality in a backward compatible manner
- PATCH version when you make backward compatible bug fixes
Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.
> [click here for more](https://semver.org/)

## Install Terraform CLI

### Workspace Lifecycle

We need to be careful with init because it will not rerun if you restart the workspace
[check here](https://www.gitpod.io/docs/configure/workspaces/tasks)

### Considerations for Terraform Installation 
The terraform installation instructions changed, [gitpod.yml](.\.gitpod.yml) does not contain the updated gpg key

Please visit the link below for most recent update

[Official Install for Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

#### Shebang 

Shebang tells the intepreter what application to use and chatgpt recommended using `#!/usr/bin/env bash` for portability

https://en.wikipedia.org/wiki/Shebang_(Unix)

For executing a script you can use `./path` and also set the file to executable using `chmod u+x FILE` e.g `chmod u+x .\bin\install_terraform_cli`

https://en.wikipedia.org/wiki/Chmod

### Working with Env Vars

We can pass env in terminal e.g `export HELLO='World'`

We can list out all environment variables using `env` command

we can filter using `env |grep AWS`

We can unset using `unser HELLO`

We can print using `echo $HELLO`

### Scoping ENV vars

When you open new terminal, it will not be aware of the env in other opened terminal

If you want to persist, you need to set it in your bashprofile i.e `bashrc`

To set a non sensitive env in gitpod

```gp env HELLO ='World' ```

### AWS CLI Installation
[Install AWS CLI DOCS](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)


[set env for AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

Run the following command to confirm aws was configured correctly
```aws sts get-caller-identity```

if successful you will get this

{
    "UserId": "AIDAWS7OFMW7ZLGVV5UPR",
    "Account": "453081654719",
    "Arn": "arn:aws:iam::#########:user/terraform-bootcamp-user"
}

created IAM USer and ADMIN group

Assign ADMIN group to Terraform-bootcamp-user

## Terraform Basics

### Terraform Registry
[Terrafrom registry](https://registry.terraform.io/)
- **Providers** is an interface to APIs that will allow to create resources in terraform
- **Modules**  are way to create templates for reuse of terraform codes

### Terraform Console

We can see a list of terraform commands by typing `terraform`

#### Terraform init

Use to initialize the working directory `terraform init`

#### Terraform plan
This will generate a change set `terraform plan`

#### Terraform apply

This will run the plan and apply the changeset `terraform apply`

To autoapprove use `terraform apply --auto-approve`

- `terraform.tfstate` contain information about the current state of your infrastructure
- .terraform contains binary of terraform

### Terraform Destroy

`Terraform destory` used to destroy a resource

### Terraform Cloud
To manually generate api token, go to your user settings

- https://app.terraform.io/app/settings/tokens

```bash
vi  /home/gitpod/.terraform.d/credentials.tfrc.json
```

``` 
  credentials "app.terraform.io" {
  token = "xxxxxx.atlasv1.zzzzzzzzzzzzz"
}
```
### create Alias for terraform in ~/.bash_profile
`alias tf="terraform"`
 reload the bash_profile to accept the new change using the following
 source ~/.bash_profile

### Root Module Structure

Our root module structure is as follows
- variables.tf
- main.tf
- providers.tf
- outputs.tf
- terraform.tfvars
- ReadMe.md

- [Click Here for More Info](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

### Module structure
- variables.tf
- main.tf
- outputs.tf
-ReadMe.md
- [Modules](https://developer.hashicorp.com/terraform/language/modules/sources)
### Terraform Cloud Variables

In Terraform cloud, we can set two types of variable
 - Environment variables
 - Terraform Variables

 ### Order of terraform variable

 Environment Variables (Highest Priority):
Variables defined as environment variables take the highest priority. You can prefix your variable names with TF_VAR_ to set them as environment variables. For example, if you have a variable named example_var, you can set it as an environment variable like this:

```bash
export TF_VAR_example_var="some_value"
Environment variables override values from other sources.
```

Variable Definitions (Variable Files):
Variables defined in .tfvars or .tfvars.json files take precedence over the following sources. You can explicitly specify variable values in these files. Variable files are usually named after the environment or purpose, like dev.tfvars, prod.tfvars, etc. You can apply these variable files using the -var-file option when running terraform apply or terraform plan.

```bash
terraform apply -var-file=dev.tfvars
Values from variable files override default variable values.
```
Default Variable Values (Lowest Priority):
Variables can have default values specified in the Terraform configuration. These default values are defined in your .tf files using the default parameter within a variable block.

```hcl
variable "example_var" {
  description = "An example variable"
  default     = "default_value"
}
```
Default values are used only if no other source provides a value for the variable.

Command Line Flags:
You can use command line flags, like -var, to specify variables when running terraform apply or terraform plan. These flags will take precedence over default values but can be overridden by values from variable files and environment variables.

```bash
terraform apply -var="example_var=new_value"
```
The order of variable sources allows you to provide values at different levels of granularity, from environment-wide defaults down to specific variable values for a single command invocation. Terraform will use the value from the highest priority source it finds for each variable.

It's important to carefully manage your variable sources to ensure that variables are appropriately set for your Terraform deployments while also maintaining flexibility for different environments and use cases.

### useful links
-[s3_object](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object)
-  [path_variable](https://developer.hashicorp.com/terraform/language/expressions/references)
    ```hcl
      resource "aws_s3_object" "index_html" {
        bucket = aws_s3_bucket.website_bucket.bucket
        key    = "index.html"
        source       = var.index_html_filepath
        etag = filemd5(var.index_html_filepath)
        # source = "${path.root}/public/index.html"
    }
    ```
- [functions in Terraform](https://developer.hashicorp.com/terraform/language/functions/filemd5)

Used etag to tag uploaded files for tracking

### Terraform Locals

- https://developer.hashicorp.com/terraform/language/values/locals

### Terraform Data Sources

- [Data Sources](https://developer.hashicorp.com/terraform/tutorials/configuration-language/data-sources)

-[Resource Lifecyce](https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle)