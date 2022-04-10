pipeline {
    agent none
    stages {
        // stage('run command based on env input') {
        //     steps {
        //         sh "terraform init -migrate-state; terraform workspace select $tfenv; terraform apply -auto-approve --var-file ${tfenv}.tfvars"                
        //     }
        // }
        stage('get public and private ec2 instances ips and private keys, then ssh and pwd') {
            input {
                message "What is your public ec2 key?"
                ok "Submit"
                parameters {
                    string(defaultValue: 'invalidkey', name: 'pubec2key', trim: true) 
                }
            }
            input {
                message "What is your priv ec2 key?"
                ok "Submit"
                parameters {
                    string(defaultValue: 'invalidkey', name: 'privec2key', trim: true) 
                }
            }
            input {
                message "What is your public ec2 IP ?"
                ok "Submit"
                parameters {
                    string(defaultValue: 'invalidip', name: 'pubec2ip', trim: true) 
                }
            }
            input {
                message "What is your private ec2 IP ?"
                ok "Submit"
                parameters {
                    string(defaultValue: 'invalidip', name: 'privec2ip', trim: true) 
                }
            }
            steps {
                sh "echo '$pubec2key' > pubec2key"
                sh "echo '$privec2key' > privec2key"
                sh "ssh -i pubec2key ec2-user@$pubec2ip"
                sh "ssh -i privec2key ec2-user@$privec2ip"
                sh "pwd"
            }
        }

    }
}