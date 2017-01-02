# Practical Deep Learning For Coders

### Setup

1. ** Create amazon AWS account **

2. ** Request EC2 limit upgrade **
	* <https://aws.amazon.com/contact-us/ec2-request>
	* Ireland (EU)
	* p2.xlarge
	* reason: fast.ai MOOC

3. ** Download Anaconda for python 2.7 **
	* <https://www.continuum.io/downloads>

4. ** Install AWS CLI **
	* `pip install awscli`
	* check by typing `aws`. If it complains about locale's check [this site](https://coderwall.com/p/-k_93g/mac-os-x-valueerror-unknown-locale-utf-8-in-python)
	
		
5. ** Create new AWS user **
	* <https://console.aws.amazon.com/iam/home?region=eu-west-1#/users$new?step=details>
	* [username] 
	* Check 'Programmatic access'
	* next
	* Add policies directly -> 'AdministratorAccess'
	* next
	* Copy / paste Access key ID & Secret access key somewhere safe (credentials.txt)
	
6. **Configure AWS**
	* `aws configure`
	* Enter previous generated credentials
	* Region: eu-west-1
	* Output: text

7. **Download setup script**
	* Check the git repo <https://github.com/fastai/courses/tree/master/setup>
	* Download setup file: 
	
	`wget https://raw.githubusercontent.com/fastai/courses/master/setup/setup_p2_ireland.sh` 	
	* `chmod 775 setup_p2_ireland.sh`
	
8. Run setup
	* `./setup_p2_ireland.sh`
	 	

