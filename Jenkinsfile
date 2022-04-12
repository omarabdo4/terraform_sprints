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
                withCredentials([sshUserPrivateKey(credentialsId: "ssh_for_ec2", keyFileVariable: 'keyfile')]) {
                    sh "ssh -i ${keyfile} ubuntu@$pubec2ip"
                    // sh "ssh ubuntu@$privec2ip"
                    sh "pwd"
                }
            }
        }

    }
}