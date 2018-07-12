pipeline {
    //Set your defensics path 
    // example "/home/user/x/x/boot.jar"
    agent any
    environment{
SEQUENCE_FILE_PATH = "${env.WORKSPACE}/environment/defensics/sequence/mutillidaefuzz.seq"
DEFENSICS_BOOTJAR_PATH = "/home/ville/defensics/Defensics/monitor/boot.jar"
DEFENSICS_SUITE_PATH = "/home/ville/defensics/Defensics/web-app-3.6.0/testtool/web-app-360.jar"}
    
    stages{


        stage('test'){
            steps{
                sh 'printenv'
                }
        }
    
        stage ('Clone') {
            steps{
            // Clean workspace before doing anything
                deleteDir()
                checkout scm
                }
        }

        stage ('Get dependencies'){
                steps{
                    sh "sh environment/get/get_git.sh"
                    sh "sh environment/get/get_browsermob.sh"
                    sh "sudo sh environment/get/get_docker.sh"
                    }
        }

        stage ('Start environment') {
            steps{
                sh "echo 'shell scripts to build project...'"    
                sh "sudo sh environment/start/start_docker.sh"
            
            //sh "sh environment/start/start_etracker.sh &"
                sh "sh environment/start/start_browsermob.sh &"
                sh "sh environment/setup/setup_browsermob.sh " 
                }
        }
	
        stage ('Tests') {
            steps{
                wrap([$class: 'Xvfb',displayNameOffset: 10]) {
  // execute selenium tests
                sh "ant -buildfile SeleniumTesting/build.xml basictest"
                sh "ant -buildfile harParser/build.xml HarParser"
                }
            }
        }
            
       
    
     
    	stage ('Defensics sequence') {
            steps{
		        sh "sudo sh environment/defensics/defensics_launch.sh ${DEFENSICS_BOOTJAR_PATH} ${DEFENSICS_SUITE_PATH} ${SEQUENCE_FILE_PATH}"
	            }
            }

    }  
    post{
        always{

            sh "sudo sh environment/destroy/destroy_docker.sh"
        
            }
        }

  
}


