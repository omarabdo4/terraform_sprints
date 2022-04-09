pipeline {
    agent any
    stages {
        stage('run command based on env input') {
            steps {
                sh "terraform init -migrate-state; terraform workspace select $env; terraform apply --var-file $env"".tfvars"
            }
        }
    }
}