Pod::Spec.new do |s|
  s.name = 'MavisSDK'
  s.platform = :ios, '10.0'
  s.version = '2.0.0'
  s.authors = 'OP Solutions'
  s.summary = 'Swift SDK for Mavis'
  s.source_files = 'Sources/MavisSDK/*.swift'
  s.vendored_frameworks = 'UnityFramework.framework', 'WikitudeSDK.framework'
  s.license = 'Proprietary'
  s.homepage = 'https://github.com/OP-Solutions/Mavis-IOS-SDK'
  s.source = { :git => 'https://github.com/OP-Solutions/Mavis-IOS-SDK.git', :tag => '2.0.0'}
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' , 'ONLY_ACTIVE_ARCH' => 'YES'}
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' , 'ONLY_ACTIVE_ARCH' => 'YES'}

end
