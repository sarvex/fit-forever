platform :ios, '8.0'
use_frameworks!

target ‘FitForever’ do

  pod 'RestKit', '~> 0.25'
  pod 'SwiftyJSON', '~> 2.3'
  pod 'Parse' , '~> 1.8.5'
  pod 'FBSDKCoreKit', '~> 4.6'
  pod 'FBSDKShareKit', '~> 4.6'
  pod 'FBSDKLoginKit', '~> 4.6'
  pod 'Fabric', '~> 1.5'
  pod 'MBProgressHUD', '~> 0.9'
  pod 'Crashlytics'
  pod 'ParseFacebookUtilsV4', '~> 1.11.0'
  pod 'ParseTwitterUtils', '~> 1.8.4'
  pod 'Google/SignIn'
  pod 'SDWebImage'
  
  post_install do |installer|
      installer.pods_project.build_configuration_list.build_configurations.each do |configuration|
          configuration.build_settings['CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES'] = 'YES'
      end
  end
 end