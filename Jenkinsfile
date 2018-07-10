node {
    // Clean workspace before doing anything
    deleteDir()

    try {
        stage ('Clone') {
            checkout scm
        }

        stage ('Get dependencies'){
            sh "sh environment/get/get_git.sh"
            sh "sh environment/get/get_browsermob.sh"
            sh "sudo sh environment/get/get_docker.sh"
            
        }
        stage ('Start environment') {
            sh "echo 'shell scripts to build project...'"    
            sh "sudo sh environment/start/start_docker.sh"
            sh "sudo sh environment/start/start_browsermob.sh&"
            sh "sudo sh environment/start/start_etracker.sh&"
                

        }
        stage ('Tests') {
            parallel 'static': {
                sh "echo 'shell scripts to run static tests...'"
            },
            'unit': {
                sh "echo 'shell scripts to run unit tests...'"
                //Go to SeleniumTesting and execute unit test. Then go back to root so later stuff won't break
                sh "cd SeleniumTesting"
                sh "ant basictest"
                sh "cd .."
            },
            'integration': {
                sh "echo 'shell scripts to run integration tests...'"
            }
        }
        
    } catch (err) {
        currentBuild.result = 'FAILED'
        throw err
    } finally {
    stage ('Destroy') {
            sh "sudo sh environment/destroy/destroy_docker.sh"
        }
}
    
}


