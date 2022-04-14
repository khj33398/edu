// Declarative //
pipeline {
	agent any

	stages {
		stage('Build') {
			steps {
				bat 'mvn build'
			}
		}
		stage('Test') {
			steps {
				bat 'make check || true'
				junit '**/target/*.xml'
			}
		}
		stage('Deploy') {
			when {
				expression {
					currentBuild.result == null || currentBuild.result == 'SUCCESS'
				}
			}
			steps {
				bat 'make publish'
			}
		}
	}
}
