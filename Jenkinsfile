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
dockerImage = docker.build registry + ":$BUILD_NUMBER"
      docker.withRegistry( '' , registryCredential) {
      dockerImage.push()
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
    }
}
