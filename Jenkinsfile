pipeline {
  agent {
    node {
      label 'mac'
    }
  }
  stages {
    stage('Checkout Submodules') {
      steps {
        sh 'git submodule update --init --recursive'
      }
    }
    stage('Build') {
      steps {
        sh './gradlew clean assembleDebug'
      }
    }
    stage('Mock tests') {
      steps {
        sh 'fastlane scan --workspace "MobileCI.xcworkspace" --scheme "MobileCI" --output_types html --output_directory reports_mock'
        archiveArtifacts(artifacts: 'reports_mock/**/*.*', fingerprint: true)
      }
    }
    stage('Live tests') {
      when { 
          branch "develop/*" 
      }
      steps {
        sh 'fastlane scan --workspace "MobileCI.xcworkspace" --scheme "MobileCIMock" --output_types html --output_directory reports'
        archiveArtifacts(artifacts: 'reports/**/*.*', fingerprint: true)
      }
    }
    stage('Sonar analysis') {
      steps {
        withSonarQubeEnv('Sonar') { 
          sh 'run-sonar-swift'
        }
      }
    }
    stage('Deploy fabric') {
      when { 
        branch "develop/*" 
      }
      steps {
        sh 'echo "TODO: FABRIC"'
      }
    }
    stage('Deploy beta') {
      when { 
        branch "release/*" 
      }
      steps {
        sh 'echo "TODO: BETA DEPLOY"'
      }
    }
  }
  post {
    always {
      sh 'echo "TODO: DESTROY"'
    }
  }
}