# Amazon Web Services Command Line Interface (AWS CLI)

## Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
- [Amazon Web Services Command Line Interface (AWS CLI)](#amazon-web-services-command-line-interface-aws-cli)
  - [Installation](#installation)
  - [Configuration](#configuration)
    - [Access key ID and secret access key](#access-key-id-and-secret-access-key)
    - [Region](#region)
    - [Output format](#output-format)
    - [Profiles](#profiles)
    - [Credential File Settings](#credential-file-settings)
      - [Where are configuration settings stored?](#where-are-configuration-settings-stored)
      - [Storing credentials in the config file](#storing-credentials-in-the-config-file)
    - [Set and view configuration settings](#set-and-view-configuration-settings)
    - [Supported `config` file settings](#supported-config-file-settings)
  - [Global settings](#global-settings)

*Generated with [DocToc](https://github.com/thlorenz/doctoc)*
<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## Installation

- See the install scripts under the [scripts](./scripts/) folder:
    - [install-aws-cli-choco.ps1](scripts/install-aws-cli-choco.ps1)
    - [install-aws-cli-msiexec.ps1](scripts/install-aws-cli-msiexec.ps1)

```powershell
# Choco Method
sudo cinst awscli

# MSIEXEC Method
sudo msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi
```

## Configuration

Use the `aws configure` command to quickly set up AWS CLI. It will prompt you for:

- [Access key ID](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html#cli-configure-quickstart-creds)
- [Secret access key](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html#cli-configure-quickstart-creds)
- [AWS Region](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html#cli-configure-quickstart-region)
- [Output format](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html#cli-configure-quickstart-format)

The AWS CLI stores this information in a profile (a collection of settings) named default in the credentials file. By default, the information in this profile is used when you run an AWS CLI command that doesn't explicitly specify a profile to use. For more information on the credentials file, see [Configuration and credential file settings](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html).

The following example shows sample values. Replace them with your own values as described in the following section:

```powershell
> aws configure
AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE
AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
Default region name [None]: us-west-2
Default output format [None]: json
```

### Access key ID and secret access key

Access keys consist of an access key ID and secret access key, which are used to sign programmatic requests that you make to AWS. If you don't have access keys, you can create them from the AWS Management Console. As a best practice, do not use the AWS account root user access keys for any task where it's not required. Instead, [create a new administrator IAM user](https://docs.aws.amazon.com/IAM/latest/UserGuide/getting-started_create-admin-group.html) with access keys for yourself.

The only time that you can view or download the secret access key is when you create the keys. You cannot recover them later. However, you can create new access keys at any time. You must also have permissions to perform the required IAM actions. For more information, see [Permissions required to access IAM resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_permissions-required.html) in the _IAM User Guide_.

**To create access keys for an IAM user**

1.  Sign in to the AWS Management Console and open the IAM console at [https://console.aws.amazon.com/iam/](https://console.aws.amazon.com/iam/).
    
2.  In the navigation pane, choose **Users**.
    
3.  Choose the name of the user whose access keys you want to create, and then choose the **Security credentials** tab.
    
4.  In the **Access keys** section, choose **Create access key**.
    
5.  To view the new access key pair, choose **Show**. You will not have access to the secret access key again after this dialog box closes. Your credentials will look something like this:
    
    -   Access key ID: AKIAIOSFODNN7EXAMPLE
        
    -   Secret access key: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
        
    
6.  To download the key pair, choose **Download .csv file**. Store the keys in a secure location. You will not have access to the secret access key again after this dialog box closes.
    
    Keep the keys confidential in order to protect your AWS account and never email them. Do not share them outside your organization, even if an inquiry appears to come from AWS or Amazon.com. No one who legitimately represents Amazon will ever ask you for your secret key.
    
7.  After you download the `.csv` file, choose **Close**. When you create an access key, the key pair is active by default, and you can use the pair right away.
    

Related topics

### Region

The `Default region name` identifies the AWS Region whose servers you want to send your requests to by default. This is typically the Region closest to you, but it can be any Region. For example, you can type `us-west-2` to use US West (Oregon). This is the Region that all later requests are sent to, unless you specify otherwise in an individual command.

You must specify an AWS Region when using the AWS CLI, either explicitly or by setting a default Region. For a list of the available Regions, see [Regions and Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html). The Region designators used by the AWS CLI are the same names that you see in AWS Management Console URLs and service endpoints.

### Output format

The `Default output format` specifies how the results are formatted. The value can be any of the values in the following list. If you don't specify an output format, `json` is used as the default.

-   [json](https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-output-format.html#json-output) – The output is formatted as a [JSON](https://json.org/) string.
    
-   [yaml](https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-output-format.html#yaml-output) – The output is formatted as a [YAML](https://yaml.org/) string. _(Available in the AWS CLI version 2 only.)_
    
-   [yaml-stream](https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-output-format.html#yaml-stream-output) – The output is streamed and formatted as a [YAML](https://yaml.org/) string. Streaming allows for faster handling of large data types. _(Available in the AWS CLI version 2 only.)_
    
-   [text](https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-output-format.html#text-output) – The output is formatted as multiple lines of tab-separated string values. This can be useful to pass the output to a text processor, like `grep`, `sed`, or `awk`.
    
-   [table](https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-output-format.html#table-output) – The output is formatted as a table using the characters +|- to form the cell borders. It typically presents the information in a "human-friendly" format that is much easier to read than the others, but not as programmatically useful.
    

### Profiles

A collection of settings is called a profile. By default, the AWS CLI uses the `default` profile. You can create and use additional named profiles with varying credentials and settings by specifying the `--profile` option and assigning a name.

The following example creates a profile named `produser`.

```
$ aws configure --profile produser
AWS Access Key ID [None]: AKIAI44QH8DHBEXAMPLE
AWS Secret Access Key [None]: je7MtGbClwBF/2Zp9Utk/h3yCo8nvbEXAMPLEKEY
Default region name [None]: us-east-1
Default output format [None]: text
```

You can then specify a ``--profile `profilename` `` and use the credentials and settings stored under that name.

```
$ aws s3 ls --profile produser
```

To update these settings, run `aws configure` again (with or without the `--profile` parameter, depending on which profile you want to update) and enter new values as appropriate. The next sections contain more information about the files that `aws configure` creates, additional settings, and named profiles.

For more information on named profiles, see [Named profiles](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html).

### Credential File Settings

You can save your frequently used configuration settings and credentials in files that are maintained by the AWS CLI.

The files are divided into `profiles`. By default, the AWS CLI uses the settings found in the profile named `default`. To use alternate settings, you can create and reference additional profiles. For more information on named profiles, see [Named profiles](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html).

You can override an individual setting by either setting one of the supported environment variables, or by using a command line parameter. For more information on configuration setting precedence, see [Configuration settings and precedence](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html#cli-configure-quickstart-precedence).

#### Where are configuration settings stored?

The AWS CLI stores sensitive credential information that you specify with `aws configure` in a local file named `credentials`, in a folder named `` `.aws` `` in your home directory. The less sensitive configuration options that you specify with `aws configure` are stored in a local file named `config`, also stored in the `` `.aws` `` folder in your home directory.

#### Storing credentials in the config file

You can keep all of your profile settings in a single file as the AWS CLI can read credentials from the `config` file. If there are credentials in both files for a profile sharing the same name, the keys in the credentials file take precedence.

These files are also used by the various language software development kits (SDKs). If you use one of the SDKs in addition to the AWS CLI, confirm if the credentials should be stored in their own file.

Where you find your home directory location varies based on the operating system, but is referred to using the environment variables `%UserProfile%` in Windows and `$HOME` or `~` (tilde) in Unix-based systems. You can specify a non-default location for the `config` file by setting the `AWS_CONFIG_FILE` environment variable to another local path. See [Environment variables to configure the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html) for details.

For example, the files generated by the AWS CLI for a default profile configured with `aws configure` looks similar to the following.

**`~/.aws/credentials`**

```
[default]
aws_access_key_id=AKIAIOSFODNN7EXAMPLE
aws_secret_access_key=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
```

**`~/.aws/config`**

```
[default]
region=us-west-2
output=json
```

For file examples with multiple named profiles, see [Named profiles](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html).

When you use a shared profile that specifies an AWS Identity and Access Management (IAM) role, the AWS CLI calls the AWS STS `AssumeRole` operation to retrieve temporary credentials. These credentials are then stored (in `` `~/.aws/cli/cache` ``). Subsequent AWS CLI commands use the cached temporary credentials until they expire, and at that point the AWS CLI automatically refreshes the credentials.

### Set and view configuration settings

There are several ways to view and set your configuration settings in the files.

**Credentials and config file**

View and edit your settings by directly editing the `config` and `credentials` files in a text editor. For more information see [Where are configuration settings stored?](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html#cli-configure-files-where)

To remove a setting, delete the corresponding setting in your `config` and `credentials` files.

**[aws configure](https://docs.aws.amazon.com/cli/latest/reference/configure/index.html)**

Run this command to quickly set and view your credentials, region, and output format. The following example shows sample values.

```bash
$ aws configure
AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE
AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
Default region name [None]: us-west-2
Default output format [None]: json
```

For more information see [Quick configuration with aws configure](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html#cli-configure-quickstart-config)

**[aws configure set](https://docs.aws.amazon.com/cli/latest/reference/configure/set.html)**

You can set any credentials or configuration settings using `aws configure set`. Specify the profile that you want to view or modify with the `--profile` setting.

For example, the following command sets the `region` in the profile named `integ`.

```bash
$ aws configure set region us-west-2 --profile integ
```

To remove a setting, use an empty string as the value, or manually delete the setting in your `config` and `credentials` files in a text editor.

```bash
$ aws configure set cli_pager "" --profile integ
```

**[`aws configure get`](https://docs.aws.amazon.com/cli/latest/reference/configure/get.html)**

You can retrieve any credentials or configuration settings you've set using `aws configure get`. Specify the profile that you want to view or modify with the `--profile` setting.

For example, the following command retrieves the `region` setting in the profile named `integ`.

```
$ aws configure get region --profile integ
us-west-2
```

If the output is empty, the setting is not explicitly set and uses the default value.

**[`aws configure import`](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/configure/import.html)**

Import `CSV` credentials generated from the AWS web console. A CSV file is imported with the profile name matching the IAM user name. The CSV file must contain the following headers.

-   User Name
    
-   Access key ID
    
-   Secret access key
    

```
$ aws configure import --csv file://credentials.csv
```

**[`aws configure list`](https://docs.aws.amazon.com/cli/latest/reference/configure/list.html)**

To list all configuration data, use the `aws configure list` command. This command displays the AWS CLI name of all settings you've configured, their values, and where the configuration was retrieved from.

```
$ aws configure list
      Name                    Value             Type    Location
      ----                    -----             ----    --------
   profile                <not set>             None    None
access_key     ****************ABCD  shared-credentials-file    
secret_key     ****************ABCD  shared-credentials-file    
    region                us-west-2             env    AWS_DEFAULT_REGION
```

**[`aws configure list-profiles`](https://docs.aws.amazon.com/cli/latest/reference/configure/list-profiles.html)**

To list all your profile names, use the `aws configure list-profiles` command.

```
$ aws configure list-profiles
default
test
```

### Supported `config` file settings

The following settings are supported in the `config` file. The values listed in the specified (or default) profile are used unless they are overridden by the presence of an environment variable with the same name, or a command line option with the same name. For more information on what order settings take precendence, see [Configuration settings and precedence](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html#cli-configure-quickstart-precedence)

## Global settings

_`api_versions`_

_(Available in the AWS CLI version 1 only.)_Some AWS services maintain multiple API versions to support backward compatibility. By default, AWS CLI commands use the latest available API version. You can specify an API version to use for a profile by including the `api_versions` setting in the `config` file.

This is a "nested" setting that is followed by one or more indented lines that each identify one AWS service and the API version to use. See the documentation for each service to understand which API versions are available.

The following example shows how to specify an API version for two AWS services. These API versions are used only for commands that run under the profile that contains these settings.

```
api_versions =
    ec2 = 2015-03-01
    cloudfront = 2015-09-017
```

This setting does not have an environment variable or command line parameter equivalent.

_`[aws_access_key_id](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html#cli-configure-quickstart-creds)`_

Specifies the AWS access key used as part of the credentials to authenticate the command request. Although this can be stored in the `config` file, we recommend that you store this in the `credentials` file.

Can be overridden by the `AWS_ACCESS_KEY_ID` environment variable. You can't specify the access key ID as a command line option.

```
aws_access_key_id = AKIAIOSFODNN7EXAMPLE
```

_`[aws_secret_access_key](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html#cli-configure-quickstart-creds)`_

Specifies the AWS secret key used as part of the credentials to authenticate the command request. Although this can be stored in the `config` file, we recommend that you store this in the `credentials` file.

Can be overridden by the `AWS_SECRET_ACCESS_KEY` environment variable. You can't specify the secret access key as a command line option.

```
aws_secret_access_key = wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
```

_`aws_session_token`_

Specifies an AWS session token. A session token is required only if you manually specify temporary security credentials. Although this can be stored in the `config` file, we recommend that you store this in the `credentials` file.

Can be overridden by the `AWS_SESSION_TOKEN` environment variable. You can't specify the session token as a command line option.

```
aws_session_token = AQoEXAMPLEH4aoAH0gNCAPyJxz4BlCFFxWNE1OPTgk5TthT+FvwqnKwRcOIfrRh3c/LTo6UDdyJwOOvEVPvLXCrrrUtdnniCEXAMPLE/IvU1dYUg2RVAJBanLiHb4IgRmpRV3zrkuWJOgQs8IZZaIv2BXIa2R4Olgk
```

_`ca_bundle`_

Specifies a CA certificate bundle (a file with the `.pem` extension) that is used to verify SSL certificates.

Can be overridden by the `[AWS_CA_Bundle](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html#envvars-list-AWS_CA_BUNDLE)` environment variable or the `[--ca-bundle](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-options.html#cli-configure-options-ca-bundle)` command line option.

```
ca_bundle = dev/apps/ca-certs/cabundle-2019mar05.pem
```

_`cli_auto_prompt`_

Enables the auto-prompt for the AWS CLI version 2. There are two settings that can be used:

-   **`on`** uses the full auto-prompt mode each time you attempt to run an `aws` command. This includes pressing **ENTER** after both a complete command or incomplete command.
    
    ```
    cli_auto_prompt = on
    ```
    
-   **`on-partial`** uses partial auto-promptmode. If a command is incomplete or cannot be run due to client-side validation errors, auto-prompt is used. This mode is particular useful if you have pre-existing scripts, runbooks, or you only want to be auto-prompted for commands you are unfamiliar with rather than prompted on every command.
    
    ```
    cli_auto_prompt = on-partial
    ```
    

You can override this setting by using the `[aws_cli_auto_prompt](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html#envvars-list-aws_cli_auto_prompt)` environment variable or the `[--cli-auto-prompt](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-options.html#cli-configure-options-cli-auto-prompt)` and `[--no-cli-auto-prompt](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-options.html#cli-configure-options-no-cli-auto-prompt)` command line parameters.

For information on the AWS CLI version 2 auto-prompt feature, see [Having the AWS CLI prompt you for commands](https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-parameters-prompting.html).

_`cli_binary_format`_

Specifies how the AWS CLI version 2 interprets binary input parameters. It can be one of the following values:

-   **base64** – This is the default value. An input parameter that is typed as a binary large object (BLOB) accepts a base64-encoded string. To pass true binary content, put the content in a file and provide the file's path and name with the `fileb://` prefix as the parameter's value. To pass base64-encoded text contained in a file, provide the file's path and name with the `file://` prefix as the parameter's value.
    
-   **raw-in-base64-out** – Provides backward compatibility with the AWS CLI version 1 behavior where binary values must be passed literally.
    

This entry does not have an equivalent environment variable. You can specify the value on a single command by using the `--cli-binary-format raw-in-base64-out` parameter.

```
cli_binary_format = raw-in-base64-out
```

If you reference a binary value in a file using the `fileb://` prefix notation, the AWS CLI _always_ expects the file to contain raw binary content and does not attempt to convert the value.

If you reference a binary value in a file using the `file://` prefix notation, the AWS CLI handles the file according to the current `cli_binary_format` setting. If that setting's value is `base64` (the default when not explicitly set), the AWS CLI expects the file to contain base64-encoded text. If that setting's value is `raw-in-base64-out`, the AWS CLI expects the file to contain raw binary content.

_`cli_follow_urlparam`_

This feature is available only with AWS CLI version 1.

The following feature is available only if you use AWS CLI version 1. It isn't available if you run AWS CLI version 2.

Specifies whether the AWS CLI attempts to follow URL links in command line parameters that begin with `http://` or `https://`. When enabled, the retrieved content is used as the parameter value instead of the URL.

-   **true** – This is the default value. If specified, any string parameters that begin with `http://` or `https://` are fetched and any downloaded content is used as the parameter value for the command.
    
-   **false** – If specified, the AWS CLI does not treat parameter string values that begin with `http://` or `https://` differently from other strings.
    

This entry does not have an equivalent environment variable or command line option.

```
cli_follow_urlparam = false
```

_`cli_pager`_

Specifies the pager program used for output. By default, AWS CLI version 2 returns all output through your operating system’s default pager program.

Can be overridden by the AWS\_PAGER environment variable.

```
cli_pager=less
```

To disable all use of an external paging program, set the variable to an empty string as shown in the following example.

```
cli_pager=
```

_`cli_timestamp_format`_

Specifies the format of timestamp values included in the output. You can specify either of the following values:

-   **iso8601** – The default value for the AWS CLI version 2. If specified, the AWS CLI reformats all timestamps according to [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html).
    
-   **wire** – The default value for the AWS CLI version 1. If specified, the AWS CLI displays all timestamp values exactly as received in the HTTP query response.
    

This entry does not have an equivalent environment variable or command line option.

```
cli_timestamp_format = iso8601
```

_`[credential_process](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-sourcing-external.html)`_

Specifies an external command that the AWS CLI runs to generate or retrieve authentication credentials to use for this command. The command must return the credentials in a specific format. For more information about how to use this setting, see [Sourcing credentials with an external process](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-sourcing-external.html).

This entry does not have an equivalent environment variable or command line option.

```
credential_process = /opt/bin/awscreds-retriever --username susan
```

_`[credential_source](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-role.html)`_

Used within Amazon EC2 instances or containers to specify where the AWS CLI can find credentials to use to assume the role you specified with the `role_arn` parameter. You cannot specify both `source_profile` and `credential_source` in the same profile.

This parameter can have one of three values:

-   **Environment** – Specifies that the AWS CLI is to retrieve source credentials from environment variables.
    
-   **Ec2InstanceMetadata** – Specifies that the AWS CLI is to use the IAM role attached to the [EC2 instance profile](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2_instance-profiles.html) to get source credentials.
    
-   **EcsContainer** – Specifies that the AWS CLI is to use the IAM role attached to the ECS container as source credentials.
    

```
credential_source = Ec2InstanceMetadata
```

_`duration_seconds`_

Specifies the maximum duration of the role session, in seconds. The value can range from 900 seconds (15 minutes) up to the maximum session duration setting for the role (which can be a maximum of 43200). This is an optional parameter and by default, the value is set to 3600 seconds.

_`[external_id](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-role.html#cli-configure-role-xaccount)`_

Specifies a unique identifier that is used by third parties to assume a role in their customers' accounts. This maps to the `ExternalId` parameter in the `AssumeRole` operation. This parameter is needed only if the trust policy for the role specifies a value for `ExternalId`. For more information, see [How to use an External Gateway When Granting Access to Your AWS Resources to a Third Party](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-user_externalid.html) in the _IAM User Guide_.

_`[max_attempts](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-retries.html)`_

Specifies a value of maximum retry attempts the AWS CLI retry handler uses, where the initial call counts toward the `max_attempts` value that you provide.

You can override this value by using the `AWS_MAX_ATTEMPTS` environment variable.

```
max_attempts = 3
```

_`[mfa_serial](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-role.html#cli-configure-role-mfa)`_

The identification number of an MFA device to use when assuming a role. This is mandatory only if the trust policy of the role being assumed includes a condition that requires MFA authentication. The value can be either a serial number for a hardware device (such as `GAHT12345678`) or an Amazon Resource Name (ARN) for a virtual MFA device (such as ``arn:aws:iam::123456789012:mfa/`user` ``).

_`[output](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html#cli-configure-quickstart-format)`_

Specifies the default output format for commands requested using this profile. You can specify any of the following values:

-   [json](https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-output-format.html#json-output) – The output is formatted as a [JSON](https://json.org/) string.
    
-   [yaml](https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-output-format.html#yaml-output) – The output is formatted as a [YAML](https://yaml.org/) string. _(Available in the AWS CLI version 2 only.)_
    
-   [yaml-stream](https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-output-format.html#yaml-stream-output) – The output is streamed and formatted as a [YAML](https://yaml.org/) string. Streaming allows for faster handling of large data types. _(Available in the AWS CLI version 2 only.)_
    
-   [text](https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-output-format.html#text-output) – The output is formatted as multiple lines of tab-separated string values. This can be useful to pass the output to a text processor, like `grep`, `sed`, or `awk`.
    
-   [table](https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-output-format.html#table-output) – The output is formatted as a table using the characters +|- to form the cell borders. It typically presents the information in a "human-friendly" format that is much easier to read than the others, but not as programmatically useful.
    

Can be overridden by the `AWS_DEFAULT_OUTPUT` environment variable or the `--output` command line option.

```
output = table
```

_`parameter_validation`_

Specifies whether the AWS CLI client attempts to validate parameters before sending them to the AWS service endpoint.

-   **true** – This is the default value. If specified, the AWS CLI performs local validation of command line parameters.
    
-   **false** – If specified, the AWS CLI does not validate command line parameters before sending them to the AWS service endpoint.
    

This entry does not have an equivalent environment variable or command line option.

```
parameter_validation = false
```

_`[region](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html#cli-configure-quickstart-region)`_

Specifies the AWS Region to send requests to for commands requested using this profile.

-   You can specify any of the Region codes available for the chosen service as listed in [AWS Regions and Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html) in the _Amazon Web Services General Reference_.
    
-   `aws_global` enables you to specify the global endpoint for services that support a global endpoint in addition to regional endpoints, such as AWS Security Token Service (AWS STS) and Amazon Simple Storage Service (Amazon S3).
    

You can override this value by using the `AWS_DEFAULT_REGION` environment variable or the `--region` command line option.

```
region = us-west-2
```

_`[retry_mode](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-retries.html)`_

Specifies which retry mode AWS CLI uses. There are three retry modes available: legacy (default), standard, and adaptive. For more information on retries, see [AWS CLI retries](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-retries.html).

You can override this value by using the `AWS_RETRY_MODE` environment variable.

```
retry_mode = standard
```

_`[role_arn](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-role.html)`_

Specifies the Amazon Resource Name (ARN) of an IAM role that you want to use to run the AWS CLI commands. You must also specify one of the following parameters to identify the credentials that have permission to assume this role:

-   source\_profile
    
-   credential\_source
    

```
role_arn = arn:aws:iam::123456789012:role/role-name
```

The environment variable [AWS\_ROLE\_ARN](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html#envvars-list-AWS_ROLE_ARN) overrides this setting.

For more information on using web identities, see [Assume role with web identity](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-role.html#cli-configure-role-oidc).

_`[role_session_name](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-role.html#cli-configure-role-session-name)`_

Specifies the name to attach to the role session. This value is provided to the `RoleSessionName` parameter when the AWS CLI calls the `AssumeRole` operation, and becomes part of the assumed role user ARN: ``arn:aws:sts::`123456789012`:assumed-role/`role_name`/`role_session_name` ``. This is an optional parameter. If you do not provide this value, a session name is generated automatically. This name appears in AWS CloudTrail logs for entries associated with this session.

```
role_session_name = maria_garcia_role
```

The environment variable [AWS\_ROLE\_SESSION\_NAME](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html#envvars-list-AWS_ROLE_SESSION_NAME) overrides this setting.

For more information on using web identities, see [Assume role with web identity](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-role.html#cli-configure-role-oidc).

_`[source_profile](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-role.html)`_

Specifies a named profile with long-term credentials that the AWS CLI can use to assume a role that you specified with the `role_arn` parameter. You cannot specify both `source_profile` and `credential_source` in the same profile.

```
source_profile = production-profile
```

_`[sso_account_id](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-sso.html)` _(Available in the AWS CLI version 2 only.)__

Specifies the AWS account ID that contains the IAM role with the permission that you want to grant to the associated AWS SSO user.

This setting does not have an environment variable or command line option.

```
sso_account_id = 123456789012
```

_`[sso_region](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-sso.html)` _(Available in the AWS CLI version 2 only.)__

Specifies the AWS Region that contains the AWS SSO portal host. This is separate from, and can be a different Region than the default CLI `region` parameter.

This setting does not have an environment variable or command line option.

```
aws_sso_region = us_west-2
```

_`[sso_role_name](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-sso.html)` _(Available in the AWS CLI version 2 only.)__

Specifies the friendly name of the IAM role that defines the user's permissions when using this profile.

This setting does not have an environment variable or command line option.

```
sso_role_name = ReadAccess
```

_`[sso_start_url](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-sso.html)` _(Available in the AWS CLI version 2 only.)__

Specifies the URL that points to the organization's AWS SSO user portal. The AWS CLI uses this URL to establish a session with the AWS SSO service to authenticate its users.

This setting does not have an environment variable or command line option.

```
sso_start_url = https://my-sso-portal.awsapps.com/start
```

_`sts_regional_endpoints`_

Specifies how the AWS CLI determines the AWS service endpoint that the AWS CLI client uses to talk to the AWS Security Token Service (AWS STS).

-   The default value for AWS CLI version 1 is `legacy`.
    
-   The default value for AWS CLI version 2 is `regional`.
    

You can specify one of two values:

-   **`legacy`** – Uses the global STS endpoint, `sts.amazonaws.com`, for the following AWS Regions: `ap-northeast-1`, `ap-south-1`, `ap-southeast-1`, `ap-southeast-2`, `aws-global`, `ca-central-1`, `eu-central-1`, `eu-north-1`, `eu-west-1`, `eu-west-2`, `eu-west-3`, `sa-east-1`, `us-east-1`, `us-east-2`, `us-west-1`, and `us-west-2`. All other Regions automatically use their respective regional endpoint.
    
-   **`regional`** – The AWS CLI always uses the AWS STS endpoint for the currently configured Region. For example, if the client is configured to use `us-west-2`, all calls to AWS STS are made to the regional endpoint `sts.us-west-2.amazonaws.com` instead of the global `sts.amazonaws.com` endpoint. To send a request to the global endpoint while this setting is enabled, you can set the Region to `aws-global`.
    

This setting can be overwritten by using the `AWS_STS_REGIONAL_ENDPOINTS` environment variable. You can't set this value as a command line parameter.

_`[web_identity_token_file](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-role.html#cli-configure-role-oidc)`_

Specifies the path to a file that contains an OAuth 2.0 access token or OpenID Connect ID token that is provided by an identity provider. The AWS CLI loads the contents of this file and passes it as the `WebIdentityToken` argument to the `AssumeRoleWithWebIdentity` operation.

The environment variable [AWS\_WEB\_IDENTITY\_TOKEN\_FILE](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html#envvars-list-AWS_WEB_IDENTITY_TOKEN_FILE) overrides this setting.

For more information on using web identities, see [Assume role with web identity](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-role.html#cli-configure-role-oidc).

_`tcp_keepalive`_

Specifies whether the AWS CLI client uses TCP keep-alive packets.

This entry does not have an equivalent environment variable or command line option.

```
tcp_keepalive = false
```

