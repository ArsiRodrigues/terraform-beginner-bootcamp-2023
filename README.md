# Terraform Beginner Bootcamp 2023

## Semantic Versioning

This project is going to utilize semantic versioniong for its tagging.
[semver.org](https://semver.org/)

The general format:

Given a version number **MAJOR.MINOR.PATCH**, eg. `1.0.1`

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes

## Install the Terraform CLI

### Considerations with the Terraform CLI Changes
The Terraform CLI installation instructions have changed due to gpg key changes. So we need to refer to the latest installl CLIS instructions via Terraform Doumentation and change the scripting for install. 

### Considerations for Linux Distribution

This project is build against Ubuntu. Please consider checking you linux distribution and change accordingly to your needs. 

[How to check OS Version in Linux]

```
cat /etc/os-release
PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```

### Refactoring into bash scripts
While fixing the Terraform CLI gpg depreciation issues we notice that bash scripts steps were a considerable amount more code. So we decided to create a bash script to install the Terraform CLI. 

This bash script is located here: [./bin/install_terraform_cli](./bin/install_terraform_cli.sh)

- This will keep the Gitpod task file ([.gitpod.yml](.gitpod.yml)) tidy.
- This allow us an easier to debug and execute manually Terraform CLI install;
- This will allow better portability for other projects that need to install Terraform CLI. 

#### Shebang considerations

A Shebang tells the bash script what program that will interpret the script. 
[]

#### Execution considerations
When executing the bash script we can use the `./` shorthand notification to execute the bash script.

eg. `#!/usr/bin/env bash`

If we are using the bash script in .gitpod.yml we need to point the script to a program do interpret it. 

eg. `source ./bin/install_terraform_cli`

- for portability for different OS distributions;
- will search the user's PATH for the bash executable
[]

#### Linux Permissions Considerations

In order to make our bash scripts executable we need to change linux permissions for the fix to be executable at the user mode. 

```sh
chmod u+x ./bin/install_terraform_cli
```

alternatively: 

```sh
chmod 744 ./bin/install_terraform_cli
```

### GitPod Lifecycle (Before, Init, Command)

We need to be careful when using the Init because it will not rerun if we restart and existing workspace. 

### AWS CLI Installation

AWS CLI is installed for this project via the bash script [`./bin/install_aws_cli`](./bin/install_aws_cli)

[getting installed with (AWS CLI)](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
[AWS CLI Env Vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

You can check if our AWS credentials is configure correctly by running the following AWS CLI command
```sh
aws sts get-caller-identity
```

If it is successfull, you should see a JSON payload like this:

```json
{
    "UserId": "AIDAUFZTJBE4ZM3VAJDGA",
    "Account": "287333484857",
    "Arn": "arn:aws:iam::287333484857:user/terraform-beginner-bootcamp"
}
```

We'll need to generate AWS CLI credits from IAM user in order to the user AWS CLI. 