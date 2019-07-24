# Deploy a GO App to AWS

We'll deploy a sample app from [Fragmenta](https://fragmenta.eu/)

## Deploy to AWS (Manually)
Two main steps:
* Setup and configure an AWS EC2 instance
* SSH to the EC2 instance and configure the Go App

#### Setup and configure an AWS EC2 instance
* Log into your AWS account
* Go to `EC2`
* Go to `Key Pairs`
  * Select `Create Key Pair`
  * Give your `Key Pair` a `<Key pair name>`
  * Select `Create`
  * This will download a `<Key pair name>.pem` to your computer
  * Note the `Key pair name` and where it was downloaded
* Go to `Instances` in the left hand navigation menu bar
* Select the blue `Launch Instance` button
* Scroll down and look for `Ubuntu Server 18.04 LTS (HVM), SSD Volume Type` and click the `Select` button to the right.
* Select the gray `Next: Configure Instance Details` button
* Select the gray `Next: Add Storage` button
* Select the gray `Next: Add Tags` button
* Select the gray `Next: Configure Security Group` button
* For the default entry, change the `Source` from `Custom` to `My IP`
* Click the `Add Rule` button
* For this new entry, change the `Type` from `Custom TCP` to `HTTP`
* Now select the blue `Review and Launch` button the bottom right
* Click the blue `Launch` button
* A popup will appear asking to select a `key pair`
  * In the first dropdown menu, make sure it is set to `Choose an existing key pair`
  * In the second dropdown menu, select your `Key pair name`
  * Check the acknowledgement box
* Select the blue `Launch Instances` button
* Now wait a few minutes for it to setup your new instance
* Ensure you have `Instances` selected the navigation bar to the left
* In the main window, checkmark the instance you just created
* In the bottom detail window, look for `Public DNS (IPv4)` and copy the info
* You need this `<Public DNS Name>` for the next step

#### SSH to the EC2 instance and configure the Go App
* Open a terminal on your local machine
* `cd` to the directory that contains the `<Key pair name>.pem`
* At the prompt, run:
```
 chmod 400 <Key pair name>.pem
 ssh -i "<Key pair name>.pem" ubuntu@<Public DNS Name>
```
* At the prompt, type `yes` and hit enter. You are now in your server!
* Enter the following:
```
 wget https://raw.githubusercontent.com/stephenchu530/deployment-fragmenta/master/install_go_demo.sh
 chmod +x install_go_demo.sh
 ./install_go_demo.sh
```
When you're ready, run the following at the prompt:
```
 fragmenta &
```
Open your favorite browser on your computer and point the URL to the `Public DNS (IPv4)` of your `EC2` instance

## Deploy Locally (MacOS)

#### Local Requirements
 * Brew
 * Postgresql

#### Install Go
* Setup your local environment
```
 export GOPATH="${HOME}/.go"
 export GOROOT="$(brew --prefix golang)/libexec"
 export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
 test -d "${GOPATH}" || mkdir "${GOPATH}"
 test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"
```
* Install Go
```
 brew install go
```
* Check Go version is `1.8` or greater
```
 go version
```

#### Install Fragmenta
```
 go get -u github.com/fragmenta/fragmenta
```
* Create a new Fragmenta CMS
```
 fragmenta new cms my/path/here
```
* Setup the local database
```
 cd my/path/here
 fragmenta migrate
```

#### Launch!
* Launch the server
```
 fragmenta
```
* Point your browser to:
```
 localhost:3000
```
# License
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/stephenchu530/deployment-fragmenta/blob/master/LICENSE)

# Contributors
* Kent Ketter [Github](https://github.com/KKetter)
* Paula Thomas [Github](https://github.com/Paula9t9)
* Roger Huba [Github](https://github.com/RogerHuba)
* Stephen Chu [Github](https://github.com/stephenchu530)
