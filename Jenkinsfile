pipeline{
    agent any

    stages{
        stage('Git Checkout'){
        steps
        {
        // Git Checkout
        script{
                checkout scmGit(branchs : [[name:'*/main']],extenstions:[],userRemoteConfigs:[[url:'https://github.com/rneduncheralathan/dell-web-app.git']])
            }
        }
        }
        stage('Delete Docker Container'){
            steps
            {
            // Delete Docker Container
            sh 'docker rm -f dell-web-app-container'
            }
        }
        stage('Docker Build'){
            steps
        {
            // Docker Build
            script{
                docker.Build('dell-web-app:latest')
            }
            }
            }
        stage('Deploy'){steps
        {
            // Deploy
            sh 'docker run -d -p 8091:80 del-web-app-container dell-web-app'
            }
            }
    }
}