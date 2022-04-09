pipeline {
    agent any
    stages {
        stage('run command based on env input') {
            steps {
                sh "terraform workspace select ${env}; terraform init; terraform apply --var-file ${env}.tfvars"
            }
        }
    }
}