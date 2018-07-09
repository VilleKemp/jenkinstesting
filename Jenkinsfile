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
            sh "sh environment/get/get_docker.sh"

        }
        stage ('Start environment') {
            sh "echo 'shell scripts to build project...'"    
		    sh "sh environment/start_environment.sh"
                

        }
        stage ('Tests') {
            parallel 'static': {
                sh "echo 'shell scripts to run static tests...'"
            },
            'unit': {
                sh "echo 'shell scripts to run unit tests...'"
            },
            'integration': {
                sh "echo 'shell scripts to run integration tests...'"
            }
        }
        stage ('Deploy') {
            sh "echo 'shell scripts to deploy to server...'"
        }
    } catch (err) {
        currentBuild.result = 'FAILED'
        throw err
    }
}


