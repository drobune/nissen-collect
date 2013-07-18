# -*- encoding: utf-8 -*-

require File.expand_path('../lib/nissen/collect/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "nissen-collect"
  gem.version       = Nissen::Collect::VERSION
  gem.summary       = %q{TODO: Summary}
  gem.description   = %q{TODO: Description}
  gem.license       = "MIT"
  gem.authors       = ["yu1ch1"]
  gem.email         = "s.yuichi227@gmail.com"
  gem.homepage      = "https://rubygems.org/gems/nissen-collect"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'rspec', '~> 2.4'
  gem.add_development_dependency 'rubygems-tasks', '~> 0.2'
  gem.add_development_dependency 'yard', '~> 0.8'
end
