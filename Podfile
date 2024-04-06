platform :ios, '16.4'

post_install do |installer|
 installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
   config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '16.4'
  end
 end
end

target 'Testownik' do
  use_frameworks!

  # Pods for Testownik
	pod 'SwiftGen', '~> 6.0'
end
