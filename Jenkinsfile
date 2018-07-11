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
            sh "sh environment/start/start_browsermob.sh&"
            sh "sh environment/start/start_etracker.sh&"
                

        }
        stage ('Tests') {


            wrap([$class: 'Xvfb',displayNameOffset: 10]) {
  // execute selenium tests
                sh "ant -buildfile SeleniumTesting/build.xml basictest"
            }

            
        }
        
        stage ('Post test') {
        sh "ant -buildfile harParser/build.xml HarParser"
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


