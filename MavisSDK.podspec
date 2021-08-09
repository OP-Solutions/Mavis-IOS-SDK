Pod::Spec.new do |s|
  s.name = 'MavisSDK'
  s.platform     = :ios, '9.0'
  s.version = '1.3.2'
  s.authors = 'OP Solutions'
  s.summary = 'Swift SDK for Mavis'
  s.source_files = 'Sources/MavisSDK/*.swift', 'UnityFramework.framework/*', 'WikitudeSDK.framework/*'
  s.exclude_files = 'WikitudeSDK.framework/Info.plist'
  s.preserve_paths = 'UnityFramework.framework/*', 'WikitudeSDK.framework/*'
  s.license = 'Proprietary'
  s.homepage = 'https://github.com/OP-Solutions/Mavis-IOS-SDK'
  s.source = { :git => 'https://github.com/OP-Solutions/Mavis-IOS-SDK.git'}
  other_frameworks =  ['UnityFramework','WikitudeSDK']
  
  other_ldflags = '$(inherited) -framework ' + other_frameworks.join(' -framework ') +
    ' -lz -lstdc++'

  s.xcconfig     = {
    'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/MavisSDK"',

    'OTHER_LDFLAGS[arch=arm64]'  => other_ldflags,
    'OTHER_LDFLAGS[arch=armv7]'  => other_ldflags,
    'OTHER_LDFLAGS[arch=armv7s]' => other_ldflags
  }
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator]' => 'arm64' }

end
