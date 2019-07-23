# Deploy a GO App to AWS

We'll deploy a sample app from [Fragmenta](https://fragmenta.eu/)

## Deploy to AWS
```
 TBD
```

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
