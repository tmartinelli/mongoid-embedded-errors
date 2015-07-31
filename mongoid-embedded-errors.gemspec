# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mongoid-embedded-errors/version'

Gem::Specification.new do |gem|
  gem.name          = "mongoid-embedded-errors"
  gem.version       = Mongoid::EmbeddedErrors::VERSION
  gem.authors       = ["Mark Bates"]
  gem.email         = ["mark@markbates.com"]
  gem.description   = %q{Easily bubble up errors from embedded documents in Mongoid.}
  gem.summary       = %q{Easily bubble up errors from embedded documents in Mongoid.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency("mongoid", ">=3.0.0")
  gem.add_dependency("active_model-errors_details", ">=1.2.0")
end
