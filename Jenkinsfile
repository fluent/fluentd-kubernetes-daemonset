 // Copyright (c) 2020, Oracle Corporation and/or its affiliates.

pipeline {
    options {
      skipDefaultCheckout true
      disableConcurrentBuilds()
    }

    agent {
        docker {
            image "${RUNNER_DOCKER_IMAGE}"
            args "${RUNNER_DOCKER_ARGS}"
            registryUrl "${RUNNER_DOCKER_REGISTRY_URL}"
            registryCredentialsId 'ocir-pull-and-push-account'
        }
    }

    environment {
        DOCKER_CREDS = credentials('ocir-pull-and-push-account')
        DOCKER_REPO="phx.ocir.io"
        OCIR_REPO_PATH="phx.ocir.io/stevengreenberginc/fluentd-kubernetes-daemonset"
        BUILD_TAG="v1.10.4-oraclelinux-elasticsearch7-1.0"
    }

    stages {
        stage('Build from source') {
            steps {
                sh """
                    cd docker-image/v1.10/oraclelinux-elasticsearch7`
                    docker image build -t ${OCIR_REPO_PATH}:${BUILD_TAG} .
                """
            }
        }

        stage('Scan image') {
            steps {
                sh """
                    cd docker-image/v1.10/oraclelinux-elasticsearch7
                    docker container run -d --name clair-db arminc/clair-db:latest
                    docker container run -d --link clair-db:postgres --name clair-scan arminc/clair-local-scan:v2.0.6
                    docker container run --rm  -v /var/run/docker.sock:/var/run/docker.sock -v .:. --network=container:clair-scan ovotech/clair-scanner clair-scanner -r scanning-report.json -l clair.log ${OCIR_REPO_PATH}:${BUILD_TAG}
                    cat scanning-report.json
                    
                    docker container stop clair-scan
                    docker container stop clair-db
                    docker container ls -a

                    export UNAPPROVED_COUNT=$(cat clair.log | grep " contains .* unapproved vulnerabilities" | sed -r 's|(.*)(contains )(.*)( unapproved vulnerabilities)|\3|g')
                    echo $UNAPPROVED_COUNT
                    echo "Completed image scanning for ${OCIR_REPO_PATH}:${BUILD_TAG}!"
                    if (($UNAPPROVED_COUNT != "NO")); then echo "${OCIR_REPO_PATH}:${BUILD_TAG} image has $UNAPPROVED_COUNT unapproved vulnerabilities" ; exit 1 ; fi ;

                """
            }
        }

        stage('Push to OCIR') {
            steps {
                sh """
                    echo "${DOCKER_CREDS_PSW}" | docker login ${env.DOCKER_REPO} -u ${DOCKER_CREDS_USR} --password-stdin
                    # docker image push ${OCIR_REPO_PATH}:${BUILD_TAG}
                """
            }
        }
    }
}