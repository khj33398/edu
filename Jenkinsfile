// Declarative //
pipeline {
	agent any

	stages {
		stage('Build') {
			steps {
				bat 'make'
				archiveArtifacts artifacts: '**/target/*.war', fingerprint: true
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

// Script //
node {
	stage('Build') {
		bat 'make'
		archiveArtifacts artifacts: '**/target/*.war', fingerprint: true
	}
	stage('Test') {
		bat 'make check || true'
		junit '**/target/*.xml'
	}
	stage('Deploy') {
		if (currentBuild.result == null || currentBuild.result == 'SUCCESS') { 
			bat 'make publish'
		}
	}
}
