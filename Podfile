# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

target 'MobileCI' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Lint
  pod 'SwiftLint'
  
  # Rx
  pod 'RxSwift', '~> 4.0'
  pod 'RxCocoa', '~> 4.0'
  pod 'Action', '~> 3.8.0'
  pod 'NSObject+Rx', '~> 4.4.1'
  
  # Network
  pod 'Moya/RxSwift', '~> 12.0.1'
  
  # Dependency Injection
  pod 'Swinject', '~> 2.5.0'
  pod 'SwinjectAutoregistration', '~> 2.5.0'
  pod 'SwinjectStoryboard', '~> 2.1.0'
  
  # Locale
  pod 'Localize-Swift', '~> 2.0'
  pod 'IBLocalizable', '~> 1.3.0'

  target 'MobileCITests' do
    inherit! :search_paths
    # Pods for testing
    pod 'RxTest', '~> 4.4.1'
    pod 'RxBlocking', '~> 4.4.1'
  end

  target 'MobileCIUITests' do
    # Pods for testing
    pod 'Cucumberish'
  end

end
