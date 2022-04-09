pipeline {
    agent any
    stages {
        stage('run command based on env input') {
            steps {
                sh "terraform init -migrate-state; terraform workspace select $tfenv; terraform apply --var-file ${tfenv}.tfvars"
            }
        }
    }
}