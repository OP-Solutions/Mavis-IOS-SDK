Pod::Spec.new do |s|
  s.name = 'MavisSDK'
  s.ios.deployment_target = '10.0'
  s.version = '1.3.1'
  s.authors = 'OP Solutions'
  s.summary = 'Swift SDK for Mavis'
  s.source_files = '**/*' , ''
  s.license = 'Proprietary'
  s.homepage = 'https://github.com/OP-Solutions/Mavis-IOS-SDK'
  s.source = { :git => 'git@github.com:OP-Solutions/Mavis-IOS-SDK.git'}
end