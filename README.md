# Sparta Node Sample App with CI

## Introduction

- This documents the process of creating a CI pipeline for a Sparta sample node app.

## Pre-Requisites
```
- Vagrant
- Ruby
- Bundler
- Virtual Box
- Git
- Jenkins
```

## Instructions

- Clone this repo
- Run vagrant up
- Go to development.local or 192.168.10.100

## Running local tests

- Run 
```
vagrant up app
vagrant up db
```

In a separate terminal window, navigate to the tests directory cd tests/

Run 
```
rake spec
```
Enter into the App
```
Vagrant ssh
```

Navigate to the app directory 
```
cd /home/ubuntu/app
```

Stop the app from running as this will prevent the tests from passing. 
```
pm2 stop app.js
```

Run
```
npm test
```
## CI

Navigate to Jenkins
Login, create a user if necessary
Create a 'new item' and click 'Freestyle Project'.
Proceed to configure the file.
