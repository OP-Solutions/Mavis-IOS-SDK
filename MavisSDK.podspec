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
  s.vendored_frameworks = "UnityFramework.xcframework/ios-arm64/UnityFramework.framework", "WikitudeSDK.xcframework/ios-arm64/WikitudeSDK.framework"
  s.license = 'Proprietary'
  s.homepage = 'https://github.com/OP-Solutions/Mavis-IOS-SDK'
  s.source = { :git => 'git@github.com:OP-Solutions/Mavis-IOS-SDK.git'}
  other_frameworks =  ['UnityFramework','WikitudeSDK']
  
  other_ldflags = '$(inherited) -framework ' + other_frameworks.join(' -framework ') +
    ' -lz -lstdc++'

  s.xcconfig     = {
    'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/opentok-ios-sdk-webrtc"',

    'OTHER_LDFLAGS[arch=arm64]'  => other_ldflags,
    'OTHER_LDFLAGS[arch=armv7]'  => other_ldflags,
    'OTHER_LDFLAGS[arch=armv7s]' => other_ldflags
  }
end
