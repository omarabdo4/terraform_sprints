pipeline {
    agent any
    stages {
        stage('run command based on env input') {
            steps {
                sh "terraform init -migrate-state; terraform workspace select $tfenv; terraform apply -auto-approve --var-file ${tfenv}.tfvars"
            }
        }
    }
}