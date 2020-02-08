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
    stage('Bundle install') {
      steps {
        sh 'bundle install'
      }
    }
    stage('Pod install') {
      steps {
        sh 'bundle exec pod repo update'
        sh 'bundle exec pod install'
      }
    }
    stage('Mock tests') {
      steps {
        sh 'bundle exec fastlane run_tests_env env:mock'
        archiveArtifacts(artifacts: 'reports_mock/**/*.*', fingerprint: true)
      }
    }
    stage('Live tests') {
      when { 
          branch "release/*" 
      }
      steps {
        sh 'bundle exec fastlane run_tests_env env:prod'
        archiveArtifacts(artifacts: 'reports_prod/**/*.*', fingerprint: true)
      }
    }
    stage('Sonar analysis') {
      steps {
        sh 'bundle exec fastlane setup_sonar_properties'
        withSonarQubeEnv('Sonar') { 
          sh 'run-sonar-swift'
        }
      }
    }
    stage('Build & upload AdHoc with Mock, Dev config') {
      when { 
        branch "develop" 
      }
      steps {
        sh 'bundle exec fastlane build_and_upload_adhoc_env env:mock'
        sh 'bundle exec fastlane build_and_upload_adhoc_env env:dev'
      }
    }
    stage('Build & deploy Beta with Dev config') {
      when { 
        branch "develop"  
      }
      steps {
        sh 'bundle exec fastlane build_and_upload_appstore_env env:dev'
      }
    }
    stage('Build & upload AdHoc with Test, Prod') {
      when { 
        branch "release/*" 
      }
      steps {
        sh 'bundle exec fastlane build_and_upload_adhoc_env env:test'
        sh 'bundle exec fastlane build_and_upload_adhoc_env env:prod'
      }
    }
    stage('Build & deploy Beta with Test, Prod config') {
      when { 
        branch "release/*" 
      }
      steps {
        sh 'bundle exec fastlane build_and_upload_appstore_env env:test'
        sh 'bundle exec fastlane build_and_upload_appstore_env env:prod'
      }
    }
  }
  post {
    always {
      sh 'echo "Destroy"'
    }
  }
}