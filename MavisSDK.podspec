Pod::Spec.new do |s|
  s.name = 'MavisSDK'
  s.platform     = :ios, '10.0'
  s.version = '1.3.2'
  s.authors = 'OP Solutions'
  s.summary = 'Swift SDK for Mavis'
  s.source_files = 'Sources/MavisSDK/*.swift',
  s.vendored_frameworks = 'WikitudeSDK.framework', 'UnityFramework.framework'
  s.license = 'Proprietary'
  s.homepage = 'https://github.com/OP-Solutions/Mavis-IOS-SDK'
  s.source = { :git => 'https://github.com/OP-Solutions/Mavis-IOS-SDK.git'}
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' , 'ONLY_ACTIVE_ARCH' => 'YES'}
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' , 'ONLY_ACTIVE_ARCH' => 'YES'}

end
