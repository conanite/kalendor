lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kalendor/version'

Gem::Specification.new do |spec|
  spec.name          = "kalendor"
  spec.version       = Kalendor::VERSION
  spec.authors       = ["Conan Dalton"]
  spec.email         = ["conan@conandalton.net"]
  spec.description   = %q{Utility classes for generating sets of dates}
  spec.summary       = %q{Utility classes for generating sets of dates}
  spec.homepage      = "http://github.com/conanite/kalendor"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency             'aduki'
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec', '>= 2.9'
  spec.add_development_dependency 'rspec_numbering_formatter'
end
