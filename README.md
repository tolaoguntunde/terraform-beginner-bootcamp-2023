# Terraform Beginner Bootcamp 2023

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