// pipeline{
//     agent any

//     stages{
//         stage('Git Checkout'){
//         steps
//         {
        // Git Checkout
        // script{
        //         checkout scmGit(branchs : [[name:'*/main']],extenstions:[],userRemoteConfigs:[[url:'https://github.com/rneduncheralathan/dell-web-app.git']])
        //     }
        // }
        // }
        // stage('Delete Docker Container'){
        //     steps
        //     {
            // Delete Docker Container
            // sh 'docker rm -f dell-web-app-container'
            // }
        // }
        // stage('Docker Build'){
        //     steps
        // {
            // Docker Build
        //     script{
        //         docker.Build('dell-web-app:latest')
        //     }
        //     }
        //     }
        // stage('Deploy'){steps
        // {
            // Deploy
//             sh 'docker run -d -p 8091:80 del-web-app-container dell-web-app'
//             }
//             }
//     }
// }

pipeline {
    agent any
    
    parameters {
        string(name: 'ENVIRONMENT', defaultValue: 'dev', description: 'Environment to deploy (dev, staging, prod)')
    }
    stages {
        stage('Print Environment') {
            steps {
                echo "Deploying to environment: ${params.ENVIRONMENT}"
            }
        }

    stage('Git Checkout'){
        steps
        {
        // Git Checkout
        script{
                checkout scmGit(branchs : [[name:'*/main']],extenstions:[],userRemoteConfigs:[[url:'https://github.com/rneduncheralathan/dell-web-app.git']])
            }
        }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def imageTag = params.ENVIRONMENT == 'prod' ? 'latest' : params.ENVIRONMENT
                    sh "docker build -t your-docker-image:${imageTag} ."
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    if (params.ENVIRONMENT == 'prod') {
                        sh "docker run -d -p 80:80 your-docker-image:latest"
                    } else if (params.ENVIRONMENT == 'staging') {
                        sh "docker run -d -p 8082:80 your-docker-image:staging"
                    } else {
                        sh "docker run -d -p 8081:80 your-docker-image:dev"
                    }
                }
            }
        }
    }
}
