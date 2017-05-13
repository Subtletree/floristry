$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'active_trail/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'active-trail'
  s.version     = ActiveTrail::VERSION
  s.authors     = ['Danny Fullerton']
  s.email       = ['northox@mantor.org']
  s.homepage    = 'https://github.com/northox/active-trail'
  s.summary     = %q{What ActiveRecord is to database but for Flor workflow engine.}
  s.description = %q{Represent complete Flor workflows using standard rails facilities, e.g. render, partials, etc.}

  s.files = Dir["{app,config,lib}/**/*"] + %w(LICENSE Rakefile README.md)
  s.test_files = Dir["test/**/*"]

  s.add_runtime_dependency 'rails', '>= 4.1.0'
  s.add_runtime_dependency 'protected_attributes', '>= 1.0.7' # TODO switch to strong_parameters
  s.add_runtime_dependency 'active_attr'

  s.add_runtime_dependency 'flor'
  s.add_runtime_dependency 'httpclient'
end