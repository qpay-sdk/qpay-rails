Gem::Specification.new do |s|
  s.name        = "qpay-rails"
  s.version     = "1.0.1"
  s.summary     = "QPay V2 payment integration for Rails"
  s.description = "Rails engine for QPay V2 payment API with view helpers and webhook support"
  s.authors     = ["QPay SDK"]
  s.license     = "MIT"
  s.homepage    = "https://github.com/qpay-sdk/qpay-rails"
  s.files       = Dir["lib/**/*", "app/**/*", "config/**/*", "README.md", "LICENSE"]
  s.require_paths = ["lib"]
  s.required_ruby_version = ">= 3.0"

  s.add_dependency "qpay", "~> 1.0"
  s.add_dependency "rails", ">= 7.0"
end
