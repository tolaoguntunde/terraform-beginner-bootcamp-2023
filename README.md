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