pipeline {
    agent any
    stages {
        stage('pwd on private ec2') {
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: "ssh_for_ec2", keyFileVariable: 'keyfile')]) {
                    sh "ssh -i ${keyfile} ubuntu@10.0.2.107"
                    sh "pwd"
                }
            }
        }

    }
}