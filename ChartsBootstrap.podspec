Pod::Spec.new do |s|
  s.name = "ChartsBootstrap"
  s.version = "0.1.0"
  s.summary = "Bootstraps ios-charts for a pleasant and modern look"
  s.homepage = "https://github.com/diatche/ios-charts-bootstrap"
  s.license = { :type => "Apache License, Version 2.0", :file => "LICENSE" }
  s.authors = "Pavel Diatchenko"
  s.ios.deployment_target = "8.0"
  s.source = { :git => "https://github.com/diatche/ios-charts-bootstrap.git", :tag => "v0.1.0" }
  s.source_files = "Classes", "ChartsBootstrap/**/*.swift"
  s.frameworks = "Foundation", "UIKit", "CoreGraphics"
  s.dependency 'Charts', '~> 2.1'
end
