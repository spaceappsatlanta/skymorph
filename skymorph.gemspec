# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'skymorph/version'

Gem::Specification.new do |spec|
  spec.name          = "skymorph"
  spec.version       = Skymorph::VERSION
  spec.authors       = ["Zac Stewart", "Thomas Holmes"]
  spec.email         = ["zgstewart@gmail.com", "thomas@devminded.com"]
  spec.description   = %q{Gem to consume SkyMorph data via the NASA SkyView service}
  spec.summary       = %q{Gem to consume SkyMorph data via the NASA SkyView service}
  spec.homepage      = "https://github.com/spaceappsatlanta/skymorph"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
