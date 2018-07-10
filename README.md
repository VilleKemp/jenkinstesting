# jenkinstesting
Currently WIP 
## What is this?
This is a repository containing a Jenkins file which is supposed to set up a demo environment, execute selenium tests to it, generate har file, remove unwanted traffic, feed it to Defensics and then use Defensics to fuzz test the environment

## Environment
Jenkinsfile sets up mutillidae using docker, Swagger-petstore using docker, exersicetracker rest api using python, browsermob and set of tests done in Junit and selenium 

## How to use this?
* Install jenkins
* Create a pipeline project
* Go to pipeline tab and change definition to "Pipeline script from SCM"
* Change SCM to Git and add this repos url to the Repository url field
* Save and Build

## TODO
* Our current iteration expects jenkins to have sudo permissions to bin/sh in docker scripts. Path should be changed to $JENKINS_WORKDIRECTORY$/enviroment/script_folder/script.sh




