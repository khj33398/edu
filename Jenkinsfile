// Declarative //
pipeline {
	agent any

	stages {
		stage('Build') {
			steps {
				sh 'mvn clean package'
				archiveArtifacts artifacts: '**/target/*.war', fingerprint: true
			}
		}
	}
}
