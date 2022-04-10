pipeline {
    agent any
    stages {
        stage('get public and private ec2 instances ips and private keys, then ssh and pwd') {
            input {
                message "What is your public and private ec2 keys and ips ?"
                ok "Submit"
                parameters {
                    string(defaultValue: 'invalidkey', name: 'pubec2key', trim: true) 
                    string(defaultValue: 'invalidkey', name: 'privec2key', trim: true) 
                    string(defaultValue: 'invalidip', name: 'pubec2ip', trim: true) 
                    string(defaultValue: 'invalidip', name: 'privec2ip', trim: true) 
                }
            }
            steps {
                sh "ssh-add - <<< ${pubec2key}"
                sh "ssh ec2-user@$pubec2ip"
                sh "ssh-add - <<< ${privec2key}"
                sh "ssh ec2-user@$privec2ip"
                sh "pwd"
            }
        }

    }
}