pipeline {
    
    agent any
    // Set your sequence file path here.
    environment{
SEQUENCE_FILE_PATH = "${env.WORKSPACE}/environment/defensics/sequence/mutillidaefuzz.seq"
HAR_FILE_PATH = "${env.WORKSPACE}/harParser/connections.har"
RESULT_PATH = "${env.WORKSPACE}/environment/defensics/results"
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
                    sh "sh environment/get/get_docker.sh"
                    }
        }

        stage ('Start environment') {
            steps{
                sh "echo 'Start docker instances'"
                sh "sh environment/start/start_docker.sh || true"
		sh "echo 'Start browsermob'"
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
		        sh "sh environment/defensics/defensics_launch.sh ${SEQUENCE_FILE_PATH} ${HAR_FILE_PATH} ${RESULT_PATH} "
	            }
            }

    }  
    post{
        always{

            sh "sh environment/destroy/destroy_docker.sh"
        
            }
        }

  
}


