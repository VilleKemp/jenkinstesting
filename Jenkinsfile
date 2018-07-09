/* 
Jenkinsfile that executes the whole demo. WIP
*/
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                /*Get all the dependencies during this step. SeleniumTesting repo + etracker + docker containers+ browsermob */
                sh git clone https://github.com/VilleKemp/SeleniumTesting.git
                sh git clone https://github.com/VilleKemp/ExerciseTracker.git
                
                /*Run setup scripts that setup the environment. How to setup paths? maybe just download everything to Jenkinsfile location and then the executionpaths are always the same. */
                sh SeleniumTesting/environment/start_environment.sh 
                sh SeleniumTesting/environment/setup_environment.sh 
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                /* Run selenium tests here*/
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                /*Just destroy here?*/
                sh environment/destroy_environment.sh 
            }
        }
    }
}
