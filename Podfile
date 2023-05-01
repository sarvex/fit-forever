platform :ios, '8.0'
use_frameworks!

target ‘FitForever’ do

  pod 'RestKit', '~> 0.25'
  pod 'SwiftyJSON', '~> 5.0'
  pod 'Parse' , '~> 1.19.0'
  pod 'FBSDKCoreKit', '~> 16.0'
  pod 'FBSDKShareKit', '~> 16.0'
  pod 'FBSDKLoginKit', '~> 16.0'
  pod 'Fabric', '~> 1.5'
  pod 'MBProgressHUD', '~> 0.9'
  pod 'Crashlytics'
  pod 'ParseFacebookUtilsV4', '~> 1.11.0'
  pod 'ParseTwitterUtils', '~> 1.11.0'
  pod 'Google/SignIn'
  pod 'SDWebImage'
  
  post_install do |installer|
      installer.pods_project.build_configuration_list.build_configurations.each do |configuration|
          configuration.build_settings['CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES'] = 'YES'
      end
  end
 end