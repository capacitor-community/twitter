
  Pod::Spec.new do |s|
    s.name = 'CapacitorTwitter'
    s.version = '0.0.1'
    s.summary = 'access native twitter features like sign in and share'
    s.license = 'MIT'
    s.homepage = 'https://github.com/stewwan/capacitor-twitter'
    s.author = 'Stewan Silva'
    s.source = { :git => 'https://github.com/stewwan/capacitor-twitter', :tag => s.version.to_s }
    s.source_files = 'ios/Plugin/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
    s.ios.deployment_target  = '11.0'
    s.dependency 'Capacitor'
    s.dependency 'TwitterKit'
    s.dependency 'TwitterCore'
  end