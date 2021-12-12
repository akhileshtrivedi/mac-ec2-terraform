# How to create EC2 instances using Terraform on Mac !!!


## Step-1 Create a new access key over AWS if you don't have one.

#### AWSAccessKeyId=  XXXXXXXXXX

#### AWSSecretKey=XXXXXXXXXX

After downloading key, we have to set in mac PATH

 cd ~

 vi ~/.zshrc
 
After  adding AWSAccessKeyId and AWSSecretKey

source  ~/.zshrc


## step-2 Create Terraform required Files

cd ~

mkdir demo-terraform

cd demo-terraform

#### sudo vi variables.tf



#### sudo vi variables.tf


## Step-3 Now here, execute the below command:

terraform fmt

terraform init

terraform validate

terraform plan

terraform apply

terraform state list

#### if you don't want to run resources, you can delete

terraform destroy


