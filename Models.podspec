
Pod::Spec.new do |spec|
  spec.name         = 'Models'
  spec.version      = '0.0.1'
  spec.license      = 'Custom'
  spec.homepage     = 'https://github.com/vapor/models-template'
  spec.authors      = { 'You' => 'you@your.domain' }
  spec.summary      = 'The shared models associated with our project'
  spec.source       = { :git => "#{spec.homepage}.git", :tag => "#{spec.version}" }
  spec.ios.deployment_target = "8.0"
  spec.osx.deployment_target = "10.10"
  spec.watchos.deployment_target = "2.0"
  spec.tvos.deployment_target = "9.0"
  spec.requires_arc = true
  spec.default_subspec = "Default"

  spec.subspec "Default" do |ss|
    ss.source_files = 'Sources/**/*.{swift}'
    ss.dependency 'JSONCocoapods', '~> 2.0'
  end
end