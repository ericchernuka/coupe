# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'coupe/version'

Gem::Specification.new do |spec|
  spec.name          = "coupe"
  spec.version       = Coupe::VERSION
  spec.authors       = ["Eric Chernuka"]
  spec.summary       = %q{Create unique human-readable coupon codes}
  spec.description   = %q{Implementation of Perl's Algorithm::CouponCode for Ruby}
  spec.homepage      = "https://github.com/ericchernuka/qpon"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
