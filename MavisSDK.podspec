Pod::Spec.new do |s|
  s.name = 'MavisSDK'
  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.11'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '3.0'
  s.version = '1.3.2'
  s.authors = 'OP Solutions'
  s.summary = 'Swift SDK for Mavis'
  s.source_files = 'Sources/MavisSDK/*.swift'
  s.license = 'Proprietary'
  s.homepage = 'https://github.com/OP-Solutions/Mavis-IOS-SDK'
  s.source = { :git => 'git@github.com:OP-Solutions/Mavis-IOS-SDK.git'}
  s.subspec 'UnityFramework' do |u|
      u.vendored_frameworks = "UnityFramework.xcframework"
  end
  s.subspec 'WikitudeSDK' do |w|
      w.vendored_frameworks = "WikitudeSDK.xcframework"
  end
end
