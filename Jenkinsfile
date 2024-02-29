pipeline {
    agent any
    triggers {
        // Configuration du déclenchement du pipeline lorsqu'un push est détecté dans le référentiel Git
        pollSCM 'H/5 * * * *'
    }
      environment {
      registry  = "houwayda/devop_esprit"
      registryCredential = 'dockerHub'
      dockerImage = ''
      }
  
          
    stages {
        stage('Récupération du code source') {
            steps {
                // Cette étape clone le référentiel Git
                git 'https://github.com/houwayda9/avec_maven'
            }
        }
 
        stage('Affichage de la date système') {
            steps {
                // Cette étape affiche la date système
                script {
                    def date = sh(script: 'date', returnStdout: true).trim()
                    echo "La date système est : ${date}"
                }
            }
        }
        stage('Construction de l\'image Docker') {
            steps {
                script {
                    dockerImage = docker.build("${registry}:${BUILD_NUMBER}")
                }
            }
        }
        stage('Push de l\'image vers le registre Docker') {
            steps {
                script {
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }

    }
}
