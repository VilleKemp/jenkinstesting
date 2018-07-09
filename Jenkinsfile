node {
    // Clean workspace before doing anything
    deleteDir()

    try {
        stage ('Clone') {
            checkout scm
        }
        stage ('Build') {
            sh "echo 'shell scripts to build project...'"
            /*Get all the dependencies during this step. SeleniumTesting repo + etracker + docker containers+ browsermob */
                sh "git clone https://github.com/VilleKemp/SeleniumTesting.git"
                sh "git clone https://github.com/VilleKemp/ExerciseTracker.git"
                //This will brake if they update browsermob. TODO find a better way. Most likely using github api which didn't want to co-operate so I used this
                sh "wget https://github.com/lightbody/browsermob-proxy/releases/download/browsermob-proxy-2.1.4/browsermob-proxy-2.1.4-bin.zip"
                //This requires unzip. 
                sh "unzip browsermob-proxy-2.1.4-bin.zip"
                

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


