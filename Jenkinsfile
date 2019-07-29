pipeline {
    agent {
        label'master'
    }
    parameters {
        choice(name: 'wls_target', choices: ['wls1', 'wls2', 'wls3'], description: 'defining wls target environment',)
    }
    stages {
        stage('checkout scm') {
            steps {
                git branch: 'master',
                    credentialsId: 'github_jenkins',
                        url: 'https://github.com/oscarose/weblogic.git'
            }
        }
        stage('stop mainWebApp war file') {
            steps {
                withCredentials([
                    usernamePassword(credentialsId: 'WLS_ID', passwordVariable: 'wls_pwd', usernameVariable: 'wls_user'),
                    usernamePassword(credentialsId: 'WLS_SSH_ID', passwordVariable: 'ssh_pwd', usernameVariable: 'ssh_user')
                ]) {
                    sh """
                    chmod 755 $WORKSPACE/wls.sh
                    echo "running wls deployer script in pearsis ${wls_target} environment"
                    ansible-playbook $WORKSPACE/wls.yaml -i $WORKSPACE/inventory --limit "${wls_target}" --extra-vars "ansible_ssh_user=$ssh_user ansible_ssh_pass=$ssh_pwd wls_target=${wls_target} wls_user=$wls_user wls_pwd=$wls_pwd"
                    """
                }
            }
        }
    }
}
