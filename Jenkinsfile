pipeline {
    
    agent any
    // Set your sequence file path here.
    environment{
SEQUENCE_FILE_PATH = "${env.WORKSPACE}/environment/defensics/sequence/mutillidaefuzz.seq"
}
    
    stages{
    
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
                    // Docker scripts are executed with full path due to permission issues. You are expected to give jenkins sudo rights to docker scripts. In order for it to work script needs to be executed using full path
                    sh "sudo sh ${env.WORKSPACE}/environment/get/get_docker.sh"
                    }
        }

        stage ('Start environment') {
            steps{
                sh "echo 'shell scripts to build project...'"
                sh "sudo sh ${env.WORKSPACE}/environment/start/start_docker.sh"
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
		        sh "sh environment/defensics/defensics_launch.sh ${SEQUENCE_FILE_PATH}"
	            }
            }

    }  
    post{
        always{

            sh "sudo sh ${env.WORKSPACE}/environment/destroy/destroy_docker.sh"
        
            }
        }

  
}


