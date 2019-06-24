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
    stage('Pod install') {
      steps {
        sh 'pod install'
      }
    }
    stage('Mock tests') {
      steps {
        sh 'fastlane run_tests_env env:mock'
        archiveArtifacts(artifacts: 'reports_mock/**/*.*', fingerprint: true)
      }
    }
    stage('Live tests') {
      when { 
          branch "develop/*" 
      }
      steps {
        sh 'fastlane run_tests_env env:prod'
        archiveArtifacts(artifacts: 'reports_prod/**/*.*', fingerprint: true)
      }
    }
    stage('Sonar analysis') {
      steps {
        withSonarQubeEnv('Sonar') { 
          sh 'run-sonar-swift'
        }
      }
    }
    stage('Build & upload AdHoc with Mock, Dev config') {
      when { 
        branch "develop/*" 
      }
      steps {
        sh 'fastlane build_and_upload_adhoc_env env:mock'
        sh 'fastlane build_and_upload_adhoc_env env:dev'
      }
    }
    stage('Build & deploy Beta with Dev config') {
      when { 
        branch "develop/*"  
      }
      steps {
        sh 'fastlane build_and_upload_appstore_env env:dev'
      }
    }
    stage('Build & upload AdHoc with Test, Prod') {
      when { 
        branch "release/*" 
      }
      steps {
        sh 'fastlane build_and_upload_adhoc_env env:test'
        sh 'fastlane build_and_upload_adhoc_env env:prod'
      }
    }
    stage('Build & deploy Beta with Test, Prod config') {
      when { 
        branch "release/*" 
      }
      steps {
        sh 'fastlane build_and_upload_appstore_env env:test'
        sh 'fastlane build_and_upload_appstore_env env:prod'
      }
    }
  }
  post {
    always {
      sh 'echo "TODO: DESTROY"'
    }
  }
}