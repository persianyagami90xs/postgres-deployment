# Getting Started
Postgres Deployment scripts are an easy way to deploy Postgres and EDB Tools at no charge. It is a contribution by the EDB team members which can help people explore both Postgres and EDB tools. Users can interact via the git repository comments section. Feel free to leave comments there. However, these scripts are not officially supported by the EnterpriseDb Team.

EnterpriseDb has the largest base of PostgreSQL experts available.

Learn more about [Professional Support] (https://www.enterprisedb.com/services/ongoing-postgresql-help/postgresql-technical-support)

The intention of this repository is as an introductory self starting guide.

Before starting to delve into this repository, it is best to get familiar with the steps in the deployment process towards Amazon Web Services.

## The overall process consists of the following steps:

1. Set up Software Prerequisites
   * Linux based Operating System
   * Package dependencies installation are accomplished via bash script
   * Google Cloud SDK installed via bash script
   * Requires configuration of Google Cloud SDK for authentication
2. Configure Google Cloud SDK with credentials
3. Create Cloud Infrastructure Prerequisites Resources
   * Performed by Terraform scripts in ```terraform/gcloud``` folder
4. Setup Postgres or EnterpriseDB Postgres Advanced Server
   * Performed by Ansible scripts in Ansible Galaxy downloaded collection: ```edb_devops.edb_postgres```
5. Execute SQL Scripts
   * Performed by Ansible scripts in ```sqlexec``` folder

----
### Software Prerequisites
1. Terraform installed and configured
2. Ansible installed and configured

**Require Installation**

* [Terraform Installation]  (https://learn.hashicorp.com/terraform/getting-started/install.html)
  ![Terraform 0.13 Installation](../../demos/Terraform_0.13_Installation.gif)

* [Ansible Installation] (https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

### Prerequisites Setup
##### Dependencies
1. Vendor Cloud SDK ( AWS, GCP or Azure )
2. Packages: curl and wget
1. Terraform >= 0.13
2. Ansible >= 2.9

### Steps

* Items to consider:
  * The Operating Systems Images ( CentOS7 and RHEL7 ) are supported across the following Google Cloud Regions: 'us-central1','us-east1', 'us-east4', 'us-west1', 'us-west2', 'us-west3' and 'us-west4'
  * A minimum of 3 instances is recommended

* The bash scripts utilized in the scripts have been tested on:
  * Red Hat 7
  * CentOS 7
  * Debian 9
  * Ubuntu 20.04

* Create your SSH Key or make it available for its reference
  ![Create SSH Key](../../demos/KeyGen.gif)
    
* Download ```postgres-deployment``` github repo by clicking on the green **Code** button followed by clicking the **Download Zip** link

* Extract the zip file to a desired destination

* Copy the ```postgres-deployment.zip``` file to the desired target directory
  
* Extract the zip file to a desired destination by utilizing Archive Manager or by: typing ```unzip postgres-deployment.zip``` and pressing the **Enter** button
 
* Open the ```Terminal``` command line

* Navigate to the extracted folder location and type: ```cd postgres-deployment``` finishing with pressing the **Enter** button

* Type: ```./lib/keygen.sh``` and execute the bash script by pressing the **Enter** button.
  ![SSH Key Generation](../../demos/KeyGen.gif)

* Type: ```./edb-deployment``` and execute the command by pressing the **Enter** button. The subcommands below will be listed as options:
```
edb-deployment [<cloud>-server|<cloud>-postgres] [OPTION]...

EDB deployment script for aws, azure and gcp

Subcommands:
    aws-server      [create|destroy]  PROJECT_NAME
    azure-server    [create|destroy]  PROJECT_NAME
    gcloud-server   [create|destroy]  PROJECT_NAME
    aws-postgres    install           PROJECT_NAME
    azure-postgres  install           PROJECT_NAME
    gcloud-postgres install           PROJECT_NAME

Other Options:
    -h, --help Display help and exit

```
  #![Create PEM Azure Resources](../../demos/AWS_Create_demo.gif)

* Type: ```./edb-deployment gcloud-postgres install PROJECT_NAME``` and execute the command by pressing the **Enter** button.
  #![Install PEM in Azure Resources](../../demos/AWS_PEM_Install.gif)

* Type: ```./edb-deployment gcloud-server destroy PROJECT_NAME``` and execute the command by pressing the **Enter** button.
  #![Removed Created Azure Resources](../../demos/AWS_PEM_destroy.gif)

### Manual Configurations
* The steps below are for reference in case there is a desire to perform configurations manually. The steps are in listed and described in their execution order and are located in the ```lib_sh``` directory:
  * keygen.sh - Removes and creates the SSH Keys
  ![Generate SSH Keys](../../demos/KeyGen.gif)
  * gcp-sdk.sh - Installs Google Cloud SDK and initiates the Google Credentials Configuration
   The results should be similar as the video below:
  ![Google Cloud SDK Installation](../../demos/Google_Cloud_SDK_Installation.gif)
  * Configure the Google Cloud SDK by typing: ```gcloud init``` and pressing **Enter** button
  ![Google Cloud SDK Login](../../demos/Google_Cloud_SDK_Login.gif)
  
### Execute SQL Statements on Postgres Cluster
##### Dependencies
1. Ansible
2. Cloud Infrastructure Prerequisites
3. Previously setup and configured Postgres or EnterpriseDB Postgres Advanced Server Instances

**Steps**

* Navigate to the **sqlexec** folder

* Refer to the example files: ```hosts.yml``` and ```playbook.yml``` located in the ```sqlexec``` directory
  ![SQLExec](../../demos/SQLExec.gif)
