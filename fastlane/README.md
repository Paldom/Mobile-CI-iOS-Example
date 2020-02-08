fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Available Actions
## iOS
### ios build_setup
```
fastlane ios build_setup
```
Set up build parameters
### ios force_delete_keychain
```
fastlane ios force_delete_keychain
```
Force keychain deletion
### ios install_pods
```
fastlane ios install_pods
```
Install pod dependencies
### ios init_certificates
```
fastlane ios init_certificates
```
Init certificates & profiles
### ios fetch_certificates
```
fastlane ios fetch_certificates
```
Fetch certificates & profiles
### ios run_tests_env
```
fastlane ios run_tests_env
```
Run tests
### ios setup_sonar_properties
```
fastlane ios setup_sonar_properties
```
Setup sonar properties file with proper keys
### ios build_and_upload_adhoc_env
```
fastlane ios build_and_upload_adhoc_env
```
Build AdHoc artifacts and upload to artifactory & firebase
### ios build_and_upload_appstore_env
```
fastlane ios build_and_upload_appstore_env
```
Build AppStore artifacts and upload to artifactory & testflight

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
