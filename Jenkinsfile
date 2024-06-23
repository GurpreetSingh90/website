node {
    def app
    agent none
    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
        agent { label 'prod' }
        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
        agent { label 'prod' }
        app = docker.build("gurpreet5803/docker-demo")
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        agent { label 'prod' }
        docker.withRegistry('https://registry.hub.docker.com', 'Docker') {
            app.push("${env.BUILD_ID}")
            app.push("latest")
        }
    }

    stage('Publish image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        agent { label 'prod' }
        sh "docker run -itd -p 3000:80 gurpreet5803/docker-demo:latest"
    }

}
