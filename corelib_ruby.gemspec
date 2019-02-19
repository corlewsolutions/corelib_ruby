# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'corelib_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "corelib_ruby"
  spec.version       = CorelibRuby::VERSION
  spec.authors       = ["roberts1000"]
  spec.email         = ["roberts@corlewsolutions.com"]

  spec.summary       = %q{Useful extensions to ruby core.}
  spec.description   = %q{Useful extensions to ruby core.}
  spec.homepage      = "https://github.com/corlewsolutions/corelib_ruby"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency "rspec", "~> 3.8.0"
  spec.add_development_dependency "pry", "~> 0.12.2"
  spec.add_development_dependency "rubocop", "~> 0.64.0"
end
