# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'comibot/version'

Gem::Specification.new do |spec|
  spec.name          = "comibot"
  spec.version       = Comibot::VERSION
  spec.authors       = ["Ryosuke Shinozaki"]
  spec.email         = ["ryshinoz@gmail.com"]
  spec.description   = %q{Write a gem description}
  spec.summary       = %q{Write a gem summary}
  spec.homepage      = "https://github.com/ryshinoz/comibot"
  spec.license       = "MIT"

  spec.add_dependency "selenium-webdriver"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
