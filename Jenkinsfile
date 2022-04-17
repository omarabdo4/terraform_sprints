pipeline {
    agent any
        // stage('run command based on env input') {
        //     steps {
        //         sh "terraform init -migrate-state; terraform workspace select $tfenv; terraform apply -auto-approve --var-file ${tfenv}.tfvars"                
        //     }
        // }
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