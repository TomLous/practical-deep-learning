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
	
	`wget https://raw.githubusercontent.com/fastai/courses/master/setup/setup_p2.sh` 	
	* `chmod 775 setup_p2.sh`
	
8. **Run setup**
	* `./setup_p2.sh`
	* Copy output in credentials
	* Copy connection command
	
9. **Connect to server**
	* `ssh -i /Users/[localUser]/.ssh/aws-key.pem ubuntu@[instanceUrl]`
	* When prompted type 'yes'

10. **Update packages & reboot**
	* Undo bug with history: `sudo rm .bash_history`
	* `sudo apt-get update`
	* `sudo apt-get upgrade`
	* `sudo reboot now`
	
11. **Check setup**
	* After reboot, login again and check nvidia drivers: `nvidia-smi`
	* Trouble shoot <http://wiki.fast.ai/index.php/AWS_install> 
	
12. **Start notebook**
	* `jupyter notebook`
	* Goto url: <http://[instanceUrl]:8888>
	* Default pass 'dl_course'

13. **Check notebooks**
	* Create new notebook in 'nbs' folder usding Python [conda root]
	* check basic command (like `1+1`)
	* check imports `import theano` & `import keras`
	
14. **Shortcuts**
	* Download aliases 
	`wget https://raw.githubusercontent.com/fastai/courses/master/setup/aws-alias.sh`
	* `source aws-alias.sh`

15. **Setup notebooks**
	* Fork the gitrepo <https://github.com/fastai/courses>
	
	*Perhaps rename it to something sensible, like **fastai-courses**?*
	
	* SSH to machine (`aws-ssh`)
	* `cd ~` if you are not already there
	* Clone your repo `git clone https://github.com/[repoUrl]`
	* Make a link to notebooks `ln -s ~/[repoName]/deeplearning1/nbs/ nbs/deeplearning1`
	* Run jupyter in background `jupyter notebook &> /dev/null &`
	* Make data dir `mkdir ~/nbs/data` and change to it `cd ~/nbs/data`
	* Download dogs&cats `wget http://www.platform.ai/data/dogscats.zip`
	* Install unzip `sudo apt-get install unzip`
	* Unzip the data `unzip -q dogscats.zip`
	* Go to your notebook <http://[instanceUrl]:8888/notebooks/deeplearning1/lesson1.ipynb>
	* Step through the process of lesson1.ipynb
	 
16. **Kaggle CLI**
	* Create profile at <https://www.kaggle.com/>
	* On server: `pip install kaggle-cli`
	* `kg config -g -u [username] -p [password] -c dogs-vs-cats-redux-kernels-edition`
	* `mkdir ~/nbs/data/dogscats.2` and cd to it
	* `kg download`
	


	 	

