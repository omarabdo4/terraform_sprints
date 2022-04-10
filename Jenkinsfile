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
                sh "echo '$pubec2key' > pubec2key"
                sh "echo '$privec2key' > privec2key"
                sh "ssh -tt -i pubec2key ec2-user@$pubec2ip"
                sh "ssh -tt -i privec2key ec2-user@$privec2ip"
                sh "pwd"
            }
        }

    }
}