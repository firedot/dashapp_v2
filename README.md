# dashapp

This repository contains development environment for an application 
that uses Python Dash (framework for building analytical web applications)

# Prerequisites: 

 1. Download and install VirtualBox from [here](https://www.virtualbox.org/wiki/Downloads)
 2. Download Vagrant from [here](https://www.vagrantup.com/downloads.html)
 3. If you want to use Terraform for provisioning, you could obtain it from [here](https://www.terraform.io/downloads.html)

## What you will find in this repository and what it will do for you: 

 * Vagrantfile 
   * It will help you bringing up your development environment

 * scripts folder
   * Contains a script, that will provision everything needed for your development environment
 
 * test folder
   * Contains scripts that are used by Travis-CI to test the following: 
     * The provisioning script located in scripts directory
     * The Python application on which you will be working
 * Travis-CI files: 
   * .travis.yml - configuration file for Travis-CI
   * requirements.txt - file with packages that need to be installed by Travis-CI so tests could be run. 
 
 * ops folder
   * Contains a Terraform configuration which you may use to deploy your application to AWS EC2
 

## How to bring up your dev environment: 

1. Clone this repository by running the following command: 

```
git clone https://github.com/firedot/dashapp_v2.git
```

2. Go into the cloned repository directory: 

```
cd dashapp_v2
```
3. Run the following command: 

```
vagrant up
```

4. Login to the machine by running:

```
vagrant ssh 
```

5. Execute the Dash application(app.py) in separate session by running:

```
python3 /vagrant/app.py &

# This command will execute your Python application. 
# You could check if it is running by going to http://localhost:8050
```

## How to use Terraform to provision: 

 * **Note:** The following instructions assume that you already have cloned the repository

 * Prerequisites: 
  - You must have Terraform installed
  - Run the following lines and replace the text in the quotes as instructed:

 ```
export TF_VAR_ami_id="<your_ami_id>"

export TF_VAR_aws_access_key="<your_aws_access_key>"

export TF_VAR_key_name="<your_aws_keyPair_name>"

export TF_VAR_aws_secret_key="<your_aws_secret_key>"

export TF_VAR_region_id="<your_aws_region>"

export TF_VAR_vpc_security_group_ids='["<vpc_security_group_ID_0>","<vpc_security_group_ID_1>"]'

export TF_VAR_ssh_username="<username_for_your_ami>"
```

1. Go in the ```ops``` dir: 

```
cd ops
```
2. Run the following command: 

```
terraform init

# This will download all the needed providers described in the configuration file

```
3. Run the following command: 

```
terraform plan

# This will create an execution plan. You could save the plan by using -o <file_name> 

```

4. Run the following command: 

```
terraform apply

# This will provision your infrastructure according to your configuration file 
```

## Development
 

## TO DO: 
 

## Done
 
 * Prepare a nice README
 * Add Travis for testing
 * Any dev should be able to clone the repo and start working by running   ``` vagrant up ```
 * Terraform code for provisioning into Prod 
 * Write a systemd start script
 * Kitchen-terraform test
