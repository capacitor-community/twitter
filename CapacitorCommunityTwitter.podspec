
  Pod::Spec.new do |s|
    s.name = 'CapacitorCommunityTwitter'
    s.version = '1.0.1'
    s.summary = 'Enable TwitterKit features for Capacitor'
    s.license = 'MIT'
    s.homepage = 'https://github.com/capacitor-community/twitter'
    s.author = 'Stewan Silva'
    s.source = { :git => 'https://github.com/capacitor-community/twitter', :tag => s.version.to_s }
    s.source_files = 'ios/Plugin/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
    s.ios.deployment_target  = '12.0'
    s.dependency 'Capacitor'
    s.dependency 'TwitterKit5'
  end
