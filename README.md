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
Setup your local environment
```
 export GOPATH="${HOME}/.go"
 export GOROOT="$(brew --prefix golang)/libexec"
 export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
 test -d "${GOPATH}" || mkdir "${GOPATH}"
 test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"
```
Install Go
```
 brew install go
```
Check Go version is `1.8` or greater

#### Install Fragmenta
Install Fragmenta
```
 go get -u github.com/fragmenta/fragmenta
```
Create a new Fragmenta CMS
```
 fragmenta new cms my/path/here
```
Setup the local database
```
 cd my/path/here
 fragmenta migrate
```

#### Launch!
Launch the server
```
 fragmenta
```
Point your browser to:
```
 localhost:3000
```
