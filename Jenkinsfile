node {
    def registryProject='localhost:5000'
    def IMAGE="${registryProject}/version-${env.BUILD_ID}"
    
    stage('Clone') {
        git "https://github.com/azessai/jenkins_build_docker.git"
    }

    def img = stage('Build') {
        docker.build("$IMAGE", '.')
    }
    stage('Run') {
        img.withRun('--name run-$BUILD_ID -p 80:80') { c ->
            sh 'docker ps'
            sh 'curl localhost'
        }
    }
    stage('Push') {
        docker.withRegistry('https://localhost:5000', '') {
            img.push 'latest'
            img.push()
        }
    }
}
